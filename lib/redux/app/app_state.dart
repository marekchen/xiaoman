import 'package:meta/meta.dart';
import '../user/user_state.dart';

@immutable
class AppState {
  AppState({
    @required this.userState,
  });
  final UserState userState;

  factory AppState.initial() {
    return AppState(
      userState: UserState.initial(),
    );
  }

  AppState copyWith({
    UserState userState,
  }) {
    return AppState(
      userState: userState ?? this.userState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              userState == other.userState;

  @override
  int get hashCode =>
      userState.hashCode;
}