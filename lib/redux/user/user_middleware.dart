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
    } else if (action is GetRoleListAction) {
      await _getRoleList(store, action, next);
    } else if (action is SwitchRoleAction) {
      await _switchRole(store, action, next);
    } else if (action is AddRoleAction) {
      await _addRole(store, action, next);
    }
  }

  Future<Null> _initUser(
      Store<AppState> store, InitUserAction action, NextDispatcher next) async {
    var result = preferences.getString("currentUser");
    var token = preferences.getString("token");
    if (result != null && result.length != 0) {
      var userJson = json.decode(result);
      var user = User.fromJson(userJson);
      next(SetUserAction(token, user));
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
      var user = User.fromJson(responseJson);
      print(user.toJson().toString());
      if (user.userId == null ||
          user.nickname == null ||
          user.rongToken == null) {
        next(ShowToastAction("登录失败，字段缺失"));
        return;
      }
      next(LoginWithVerifyCodeSuccessAction(
          action.context, responseJson['token'], user));
      print('chenpei1:token:'+ responseJson['token']);
      await preferences.setString("token", responseJson['token']);
      await preferences.setString(
          "currentUser", json.encode(user));
      next(ShowToastAction("登录成功"));
      Navigator.pop(action.context);
      // Navigator.pop(action.context);
    } else {
      next(LoginWithVerifyCodeFailedAction());
      next(ShowToastAction("登录失败，验证码错误"));
    }
  }

  Future<Null> _updateUser(Store<AppState> store, UpdateUserAction action,
      NextDispatcher next) async {
    await preferences.setString(
        "currentUser", json.encode(store.state.userState.currentUser));
  }

  Future<Null> _changeUser(Store<AppState> store, ChangeUserAction action,
      NextDispatcher next) async {
    await preferences.setString("token", store.state.userState.token);
    await preferences.setString(
        "currentUser", json.encode(store.state.userState.currentUser));
    Navigator.pop(action.context);
  }

  Future<Null> _logout(
      Store<AppState> store, LogoutAction action, NextDispatcher next) async {
    await preferences.remove("token");
    await preferences.remove("currentUser");
    next(ShowToastAction("退出登录成功"));
    Navigator.pop(action.context);
  }

  Future<Null> _getRoleList(Store<AppState> store, GetRoleListAction action,
      NextDispatcher next) async {
    String token = store.state.userState.token;
    print('chenpei2'+ token);
    var response = await api.getRoleList(token);
    Map<String, dynamic> responseJson = json.decode(response.body);
    if (response.statusCode != 200) {
      next(ShowToastAction("获取身份列表失败"));
    }
    var code = responseJson['code'];
    if (code == 0) {
      List<User> roleList = [];
      var roleListJson = responseJson['list'];
      print(roleListJson);
      for (var userJson in roleListJson) {
        var user = User.fromJson(userJson);
        roleList.add(user);
      }
      next(GetRoleListSuccessAction(roleList));
    } else {
      next(ShowToastAction("获取身份列表失败，其他错误"));
    }
  }

  Future<Null> _switchRole(Store<AppState> store, SwitchRoleAction action,
      NextDispatcher next) async {
    String token = store.state.userState.token;
    var selectedUser = store.state.userState.roleList[action.index];
    var userId = selectedUser.userId;
    var response = await api.switchRole(token, userId);
    Map<String, dynamic> responseJson = json.decode(response.body);
    if (response.statusCode != 200) {
      next(ShowToastAction("切换失败"));
    }
    var code = responseJson['code'];
    if (code == 0) {
      var user = User.fromJson(responseJson);
      user.nickname = selectedUser.nickname;
      if (user.userId == null ||
          user.nickname == null ||
          user.rongToken == null) {
        next(ShowToastAction("切换失败，字段缺失"));
        return;
      }
      next(SwitchRoleSuccessAction(
          action.context, responseJson['token'], user, action.index));
      next(ShowToastAction("切换成功"));
    } else {
      next(ShowToastAction("切换失败,其他错误"));
    }
  }

  Future<Null> _addRole(
      Store<AppState> store, AddRoleAction action, NextDispatcher next) async {
    String token = store.state.userState.token;
    var response =
        await api.addRole(token, action.avatar, action.nickname, action.gender);
    Map<String, dynamic> responseJson = json.decode(response.body);
    if (response.statusCode != 200) {
      next(ShowToastAction("添加失败"));
    }
    var code = responseJson['code'];
    if (code == 0) {
      User user = User(
        userId: responseJson['user_id'],
        nickname: action.nickname,
        avatar: action.avatar,
      );
      if (user.userId == null ||
          user.nickname == null ||
          user.rongToken == null) {
        next(ShowToastAction("添加失败，字段缺失"));
        return;
      }
      next(AddRoleSuccessAction(action.context, user));
      next(ShowToastAction("添加成功"));
      Navigator.of(action.context).pop();
    } else {
      next(ShowToastAction("添加失败"));
    }
  }
}
