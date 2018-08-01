import 'package:redux/redux.dart';
import 'package:xiaoman/model/user.dart';
import './user_actions.dart';
import './user_state.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, SetUserAction>(_setUser),
  TypedReducer<UserState, LoginWithVerifyCodeAction>(_loginWithVerifyCode),
  TypedReducer<UserState, LoginWithVerifyCodeSuccessAction>(_loginWithVerifyCodeSuccess),
  TypedReducer<UserState, LoginWithVerifyCodeFailedAction>(_loginWithVerifyCodeFailed),
  TypedReducer<UserState, LoginWithThirdAction>(_loginWithThird),
  TypedReducer<UserState, LoginWithThirdSuccessAction>(_loginWithThirdSuccess),
  TypedReducer<UserState, LoginWithThirdFailedAction>(_loginWithThirdFailed),
  TypedReducer<UserState, UpdateUserAction>(_updateUser),
  TypedReducer<UserState, ChangeUserAction>(_changeUser),
  TypedReducer<UserState, LogoutAction>(_logout),
  TypedReducer<UserState, GetRoleListSuccessAction>(_getRoleListSuccess),
  TypedReducer<UserState, SwitchRoleSuccessAction>(_switchRoleSuccess),
  TypedReducer<UserState, AddRoleSuccessAction>(_addRoleListSuccess),
]);

UserState _setUser(UserState state, SetUserAction action) {
  return state.copyWith(currentUser: action.currentUser, token: action.token);
}

UserState _loginWithVerifyCode(UserState state, LoginWithVerifyCodeAction action) {
  return state.copyWith(loginPhoneLoading: true);
}

UserState _loginWithVerifyCodeSuccess(UserState state, LoginWithVerifyCodeSuccessAction action) {
  return state.copyWith(currentUser: action.currentUser, token: action.token, loginPhoneLoading: false);
}

UserState _loginWithVerifyCodeFailed(UserState state, LoginWithVerifyCodeFailedAction action) {
  return state.copyWith(loginPhoneLoading: false);
}

UserState _loginWithThird(UserState state, LoginWithThirdAction action) {
  return state.copyWith(loginLoading: true);
}

UserState _loginWithThirdSuccess(UserState state, LoginWithThirdSuccessAction action) {
  return state.copyWith(currentUser: action.currentUser, token: action.token, loginLoading: false);
}

UserState _loginWithThirdFailed(UserState state, LoginWithThirdFailedAction action) {
  return state.copyWith(loginLoading: false);
}

UserState _updateUser(UserState state, UpdateUserAction action) {
  return state.copyWith(currentUser: action.currentUser);
}

UserState _changeUser(UserState state, ChangeUserAction action) {
  return state.copyWith(currentUser: action.currentUser, token: action.token);
}

UserState _logout(UserState state, LogoutAction action) {
  return UserState.initial();
}

UserState _getRoleListSuccess(
    UserState state, GetRoleListSuccessAction action) {
  return state.copyWith(roleList: action.roleList);
}

UserState _switchRoleSuccess(UserState state, SwitchRoleSuccessAction action) {
  return state.copyWith(
      currentUser: action.currentUser,
      token: action.token,
      currentIndex: action.currentIndex);
}

UserState _addRoleListSuccess(UserState state, AddRoleSuccessAction action) {
  List<User> roleList = state.roleList;
  roleList.add(action.user);
  return state.copyWith(roleList: roleList);
}
