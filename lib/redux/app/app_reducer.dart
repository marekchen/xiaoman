import './app_state.dart';
import '../user/user_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    userState: userReducer(state.userState, action),
  );
}
