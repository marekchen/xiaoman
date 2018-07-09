import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xiaoman/model/user.dart';
import 'package:xiaoman/redux/common/common_actions.dart';
import '../../networking/api.dart';
import '../user/user_actions.dart';
import '../app/app_state.dart';

class UserMiddleware extends MiddlewareClass<AppState> {
  final Api api;

  final SharedPreferences preferences;

  UserMiddleware(this.api, this.preferences);

  @override
  Future<Null> call(
      Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (action is InitUserAction) {
      await _initUser(store, action, next);
    } else if (action is LoginWithVerifyCodeAction) {
      await _loginWithVerifyCode(store, action, next);
    } else if (action is UpdateUserAction) {
      await _updateUser(store, action, next);
    } else if (action is ChangeUserAction) {
      await _changeUser(store, action, next);
    } else if (action is LogoutAction) {
      await _logout(store, action, next);
    }
  }

  Future<Null> _initUser(
      Store<AppState> store, InitUserAction action, NextDispatcher next) async {
    var result = preferences.getString("currentUser");
    if (result != null && result.length != 0) {
      var userInfo = json.decode(result);
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
      next(SetUserAction(userInfo['token'], user));
    }
  }

  Future<Null> _loginWithVerifyCode(Store<AppState> store,
      LoginWithVerifyCodeAction action, NextDispatcher next) async {
    var mobile = action.mobile;
    var verifyCode = action.verifyCode;
    var response = await api.loginWithVerifyCode(mobile, verifyCode);
    Map<String, dynamic> responseJson = json.decode(response.body);
    if (response.statusCode != 200) {
      next(ShowToastAction("登录失败"));
    }
    var code = responseJson['code'];
    if (code == 0) {
      User user = User(
        userId: responseJson['userId'],
        nickname: responseJson['nickename'],
        avatar: responseJson['avatar'],
        rongToken: responseJson['rongToken'],
      );
      next(LoginSuccessAction(action.context, responseJson['token'], user));
      await preferences.setString(
          "currentUser", store.state.userState.toString());
      next(ShowToastAction("登录成功"));
      Navigator.pop(action.context);
    } else {
      next(ShowToastAction("登录失败，验证码错误"));
    }
  }

  Future<Null> _updateUser(Store<AppState> store, UpdateUserAction action,
      NextDispatcher next) async {
    await preferences.setString(
        "currentUser", store.state.userState.toString());
  }

  Future<Null> _changeUser(Store<AppState> store, ChangeUserAction action,
      NextDispatcher next) async {
    await preferences.setString(
        "currentUser", store.state.userState.toString());
    Navigator.pop(action.context);
  }

  Future<Null> _logout(
      Store<AppState> store, LogoutAction action, NextDispatcher next) async {
    await preferences.remove("currentUser");
  }

//
//  Future<Null> _getUserInfo(Store<AppState> store, GetUserInfoAction action,
//      NextDispatcher next) async {
//    var token = preferences.getString('token');
//    var response = await api.getUserInfo(token);
//    Map<String, dynamic> responseJson = json.decode(response.body);
//    if (response.statusCode != 200) {
//      next(ShowToastAction("请求验证码失败"));
//      return;
//    }
//    var code = responseJson['code'];
//    if (code == 0) {
//      var userInfo = responseJson['userInfo'];
//      User user = User(
//        userId: userInfo['userId'],
//        nickname: userInfo['nickename'],
//        avatar: userInfo['avatar'],
//        rongToken: userInfo['rongToken'],
//        focusCount: userInfo['focus_count'],
//        gender: userInfo['gender'],
//        signature: userInfo['signature'],
//        collectCount: userInfo['collect_count'],
//      );
//      next(UpdateUserAction(user));
//    } else {
//      // 请求验证码失败
//      next(ShowToastAction("请求验证码失败"));
//    }
//  }
//
//  Future<Null> _loginWithVerifyCode(Store<AppState> store,
//      LoginWithVerifyCodeAction action, NextDispatcher next) async {
//    var mobile = action.mobile;
//    var verifyCode = action.verifyCode;
//    var response = await api.loginWithVerifyCode(mobile, verifyCode);
//
//  }
//
}
