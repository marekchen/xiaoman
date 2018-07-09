import 'package:redux/redux.dart';
import './user_actions.dart';
import './user_state.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, LoginSuccessAction>(_loginSuccess),
  TypedReducer<UserState, UpdateUserAction>(_updateUser),
  TypedReducer<UserState, ChangeUserAction>(_changeUser),
  TypedReducer<UserState, LogoutAction>(_logout),
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
