import 'package:meta/meta.dart';
import '../../model/user.dart';

@immutable
class UserState {
  UserState({
    @required this.currentUser,
    @required this.token,
    @required this.roleList,
    @required this.currentIndex,
  });

  final User currentUser;
  final String token;
  final List<User> roleList;
  final int currentIndex;

  factory UserState.initial() {
    return UserState(
      currentUser: null,
      token: "",
      roleList: null,
      currentIndex: 0,
    );
  }

  UserState copyWith({
    User currentUser,
    String token,
    List<User> roleList,
    int currentIndex,
  }) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
      token: token ?? this.token,
      roleList: roleList ?? this.roleList,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserState &&
          runtimeType == other.runtimeType &&
          currentUser == other.currentUser &&
          token == other.token &&
          roleList == other.roleList &&
          currentIndex == other.currentIndex;

  @override
  int get hashCode =>
      currentUser.hashCode ^
      token.hashCode ^
      roleList.hashCode ^
      currentIndex.hashCode;
}
