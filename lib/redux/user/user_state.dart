import 'package:meta/meta.dart';

import 'package:xiaoman/model/user.dart';

@immutable
class UserState {
  UserState({
    @required this.loginPhoneLoading,
    @required this.loginLoading,
    @required this.currentUser,
    @required this.token,
    @required this.roleList,
    @required this.currentIndex,
  });

  final bool loginPhoneLoading;
  final bool loginLoading;
  final User currentUser;
  final String token;
  final List<User> roleList;
  final int currentIndex;

  factory UserState.initial() {
    return UserState(
      loginPhoneLoading: false,
      loginLoading: false,
      currentUser: null,
      token: "",
      roleList: null,
      currentIndex: 0,
    );
  }

  UserState copyWith({
    bool loginPhoneLoading,
    bool loginLoading,
    User currentUser,
    String token,
    List<User> roleList,
    int currentIndex,
  }) {
    return UserState(
      loginPhoneLoading: loginPhoneLoading ?? this.loginPhoneLoading,
      loginLoading: loginLoading ?? this.loginLoading,
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
          loginPhoneLoading == other.loginPhoneLoading &&
          loginLoading == other.loginLoading &&
          currentUser == other.currentUser &&
          token == other.token &&
          roleList == other.roleList &&
          currentIndex == other.currentIndex;

  @override
  int get hashCode =>
      loginPhoneLoading.hashCode ^
      loginLoading.hashCode ^
      currentUser.hashCode ^
      token.hashCode ^
      roleList.hashCode ^
      currentIndex.hashCode;
}
