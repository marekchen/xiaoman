//import 'dart:async';
//import 'dart:convert';
//
//import 'package:flutter/widgets.dart';
//import 'package:redux_epics/redux_epics.dart';
//import 'package:rxdart/rxdart.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:xiaoman/app.dart';
//import 'package:xiaoman/model/user.dart';
//import 'package:xiaoman/redux/app/app_state.dart';
//import 'package:xiaoman/redux/common/common_actions.dart';
//import 'package:xiaoman/redux/user/user_actions.dart';
//
//final userEpic = combineEpics<AppState>([
//  _initUser,
//  _loginWithVerifyCode,
//  _loginSuccess,
//  _updateUser,
//  _changeUser,
//  _logout
//]);
//
//Stream<dynamic> _initUser(Stream<dynamic> actions, EpicStore<AppState> store) {
//  return Observable(actions)
//      .ofType(new TypeToken<InitUserAction>())
//      .asyncMap((action) => SharedPreferences.getInstance().then((prefs) {
//            return prefs.getString("currentUser");
//          }).then((result) {
//            if (result != null && result.length != 0) {
//              var userInfo = json.decode(result);
//              User user = User(
//                userId: userInfo['userId'],
//                nickname: userInfo['nickename'],
//                avatar: userInfo['avatar'],
//                rongToken: userInfo['rongToken'],
//                focusCount: userInfo['focus_count'],
//                gender: userInfo['gender'],
//                signature: userInfo['signature'],
//                collectCount: userInfo['collect_count'],
//              );
//              return UpdateUserAction(userInfo['token'], user);
//            }
//          }).catchError((error) => DoNothing()));
//}
//
//Stream<dynamic> _loginWithVerifyCode(
//    Stream<dynamic> actions, EpicStore<AppState> store) {
//  return Observable(actions)
//      .ofType(new TypeToken<LoginWithVerifyCodeAction>())
//      .asyncMap((action) => App()
//              .api
//              .loginWithVerifyCode(action.mobile, action.verifyCode)
//              .then((response) {
//            Map<String, dynamic> responseJson = json.decode(response.body);
//            if (response.statusCode != 200) {
//              return ShowToastAction("登录失败");
//            }
//            var code = responseJson['code'];
//            if (code == 0) {
//              User user = User(
//                userId: responseJson['userId'],
//                nickname: responseJson['nickename'],
//                avatar: responseJson['avatar'],
//                rongToken: responseJson['rongToken'],
//              );
//              return LoginSuccessAction(
//                  action.context, responseJson['token'], user);
//            } else {
//              return ShowToastAction("登录失败，验证码错误");
//            }
//          }).catchError((error) => ShowToastAction("发生错误")));
//}
//
//Stream<dynamic> _loginSuccess(
//    Stream<dynamic> actions, EpicStore<AppState> store) {
//  return Observable(actions)
//      .ofType(new TypeToken<LoginSuccessAction>())
//      .asyncMap((action) => SharedPreferences.getInstance().then((prefs) {
//            return prefs.setString(
//                "currentUser", store.state.userState.toString());
//          }).then((success) {
//            Navigator.pop(action.context);
//            return ShowToastAction("登录成功");
//          }).catchError((error) => DoNothing()));
//}
//
//Stream<dynamic> _updateUser(
//    Stream<dynamic> actions, EpicStore<AppState> store) {
//  return Observable(actions)
//      .ofType(new TypeToken<UpdateUserAction>())
//      .asyncMap((action) => SharedPreferences.getInstance().then((prefs) {
//            return prefs.setString(
//                "currentUser", store.state.userState.toString());
//          }).then((success) {
//            return DoNothing();
//          }).catchError((error) => DoNothing()));
//}
//
//Stream<dynamic> _changeUser(
//    Stream<dynamic> actions, EpicStore<AppState> store) {
//  return Observable(actions)
//      .ofType(new TypeToken<ChangeUserAction>())
//      .asyncMap((action) => SharedPreferences.getInstance().then((prefs) {
//            return prefs.setString(
//                "currentUser", store.state.userState.toString());
//          }).then((success) {
//            Navigator.pop(action.context);
//            return DoNothing();
//          }).catchError((error) => DoNothing()));
//}
//
//Stream<dynamic> _logout(Stream<dynamic> actions, EpicStore<AppState> store) {
//  return Observable(actions)
//      .ofType(new TypeToken<LogoutAction>())
//      .asyncMap((action) => SharedPreferences.getInstance().then((prefs) {
//            return prefs.remove("currentUser");
//          }).then((success) {
//            Navigator.pop(action.context);
//            return DoNothing();
//          }).catchError((error) => DoNothing()));
//}
