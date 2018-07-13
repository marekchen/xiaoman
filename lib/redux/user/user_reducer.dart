import 'package:redux/redux.dart';
import 'package:xiaoman/model/user.dart';
import './user_actions.dart';
import './user_state.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, LoginSuccessAction>(_loginSuccess),
  TypedReducer<UserState, UpdateUserAction>(_updateUser),
  TypedReducer<UserState, ChangeUserAction>(_changeUser),
  TypedReducer<UserState, LogoutAction>(_logout),
  TypedReducer<UserState, GetRoleListSuccessAction>(_getRoleListSuccess),
  TypedReducer<UserState, SwitchRoleSuccessAction>(_switchRoleSuccess),
  TypedReducer<UserState, AddRoleSuccessAction>(_addRoleListSuccess),
]);

UserState _loginSuccess(UserState state, LoginSuccessAction action) {
  return state.copyWith(currentUser: action.currentUser, token: action.token);
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
