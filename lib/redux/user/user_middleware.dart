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
    if (action is LogoutAction) {
      _logout(store, action, next);
    } else if (action is GetUserInfoAction) {
      _getUserInfo(store, action, next);
    } else if (action is UpdateUserAction) {
      _updateUser(store, action, next);
    } else if (action is LoginWithVerifyCodeAction) {
      _loginWithVerifyCode(store, action, next);
    } else if (action is LoginSuccessAction) {
      _loginSuccess(store, action, next);
    }
  }

  Future<bool> _logout(
      Store<AppState> store, LogoutAction action, NextDispatcher next) async {
    var success = await preferences.remove("currentUser");
    return success;
  }

  Future<bool> _updateUser(Store<AppState> store, UpdateUserAction action,
      NextDispatcher next) async {
    print("chenpei" + store.state.userState.toString());
    var success = await preferences.setString(
        "currentUser", store.state.userState.toString());

    return success;
  }

  Future<Null> _getUserInfo(Store<AppState> store, GetUserInfoAction action,
      NextDispatcher next) async {
    var token = preferences.getString('token');
    var response = await api.getUserInfo(token);
    Map<String, dynamic> responseJson = json.decode(response.body);
    if (response.statusCode != 200) {
      next(ShowToastAction("请求验证码失败"));
      return;
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
      next(UpdateUserAction(user));
    } else {
      // 请求验证码失败
      next(ShowToastAction("请求验证码失败"));
    }
  }

  Future<Null> _loginWithVerifyCode(Store<AppState> store,
      LoginWithVerifyCodeAction action, NextDispatcher next) async {
    var mobile = action.mobile;
    var verifyCode = action.verifyCode;
    var response = await api.loginWithVerifyCode(mobile, verifyCode);

  }

  Future<Null> _loginSuccess(Store<AppState> store, LoginSuccessAction action,
      NextDispatcher next) async {
    await preferences.setString(
        "currentUser", store.state.userState.toString());
    Navigator.pop(action.context);
  }
}
