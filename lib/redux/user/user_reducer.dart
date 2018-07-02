import './user_actions.dart';
import './user_state.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, GetVerifyCodeAction>(_changeTheater),
  TypedReducer<UserState, LoginWithVerifyCodeAction>(_changeTheater),
  TypedReducer<UserState, LoginWithThirdAction>(_changeTheater),
]);

UserState _changeTheater(UserState state, dynamic _) {
  return state.copyWith(currentUser: null);
}
