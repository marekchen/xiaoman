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

Stream<dynamic> _updateUser(
    Stream<dynamic> actions, EpicStore<AppState> store) {}

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
              return ShowToastAction("登录失败");
            }
            var code = responseJson['code'];
            if (code == 0) {
              User user = User(
                userId: responseJson['userId'],
                nickname: responseJson['nickename'],
                avatar: responseJson['avatar'],
                rongToken: responseJson['rongToken'],
              );
              return UpdateUserAction(user);
            } else {
              // 请求验证码失败
              print("2222");
              return ShowToastAction("登录失败");
            }
          }).catchError((error) => ShowToastAction("登录失败")));
}
