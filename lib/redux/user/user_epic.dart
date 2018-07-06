import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xiaoman/app.dart';
import 'package:xiaoman/model/user.dart';
import 'package:xiaoman/redux/app/app_state.dart';
import 'package:xiaoman/redux/common/common_actions.dart';
import 'package:xiaoman/redux/user/user_actions.dart';

final userEpic = combineEpics<AppState>([_loginWithVerifyCode]);

Stream<dynamic> _loginWithVerifyCode(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return new Observable(actions)
      .ofType(new TypeToken<LoginWithVerifyCodeAction>())
      .asyncMap((action) => App()
              .api
              .loginWithVerifyCode(action.mobile, action.verifyCode)
              .then((response) {
            Map<String, dynamic> responseJson = json.decode(response.body);
            if (response.statusCode != 200) {
              return ShowToastAction("请求验证码失败");
            }
            var code = responseJson['code'];
            if (code == 0) {
              var userInfo = responseJson['userInfo'];
              User user = User(
                userId: userInfo['userId'],
                nickname: userInfo['nickename'],
                avatar: userInfo['avatar'],
                rongToken: userInfo['rongToken'],
                focusCount: userInfo['focus_count'],
                gender: userInfo['gender'],
                signature: userInfo['signature'],
                collectCount: userInfo['collect_count'],
              );
              return [UpdateUserAction(user), ShowToastAction("请求验证码成功")];
            } else {
              // 请求验证码失败
              return ShowToastAction("请求验证码失败");
            }
          }).catchError((error) => ShowToastAction("请求验证码失败")));
}
