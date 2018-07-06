import 'package:meta/meta.dart';
import '../../model/user.dart';

@immutable
class UserState {
  UserState({
    @required this.currentUser,
    @required this.token,
  });

  final User currentUser;
  final String token;

  factory UserState.initial() {
    return UserState(
      currentUser: null,
      token: null,
    );
  }

  UserState copyWith({
    User currentUser,
    String token,
  }) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
      token: token ?? this.token,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserState &&
          runtimeType == other.runtimeType &&
          currentUser == other.currentUser &&
          token == other.token;

  @override
  int get hashCode => currentUser.hashCode ^ token.hashCode;
}
