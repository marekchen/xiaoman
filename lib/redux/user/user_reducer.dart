import 'package:redux/redux.dart';
import './user_actions.dart';
import './user_state.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, ChangeUserAction>(_changeUser),
  TypedReducer<UserState, LogoutAction>(_logout),
  TypedReducer<UserState, UpdateUserAction>(_updateUser),
]);

UserState _changeUser(UserState state, ChangeUserAction action) {
  return state.copyWith(currentUser: action.currentUser, token: action.token);
}

UserState _logout(UserState state, LogoutAction action) {
  return UserState.initial();
}

UserState _updateUser(UserState state, UpdateUserAction action) {
  return state.copyWith(currentUser: action.currentUser);
}
