import 'package:meta/meta.dart';
import '../../model/user.dart';

@immutable
class UserState {
  UserState({
    @required this.currentUser,
  });

  final User currentUser;

  factory UserState.initial() {
    return UserState(
      currentUser: null,
    );
  }

  UserState copyWith({
    User currentUser,
  }) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserState &&
              runtimeType == other.runtimeType &&
              currentUser == other.currentUser;

  @override
  int get hashCode =>
      currentUser.hashCode;
}