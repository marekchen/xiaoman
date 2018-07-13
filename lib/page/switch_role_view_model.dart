import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:xiaoman/model/user.dart';
import 'package:xiaoman/redux/app/app_state.dart';
import 'package:xiaoman/redux/user/user_actions.dart';

class SwitchRoleViewModel {
  SwitchRoleViewModel({
    @required this.token,
    @required this.currentUser,
    @required this.currentIndex,
    @required this.roleList,
    @required this.getRoleList,
    @required this.switchRole,
  });

  final String token;
  final User currentUser;
  final int currentIndex;
  final List<User> roleList;
  final Function getRoleList;
  final Function switchRole;

  static SwitchRoleViewModel fromStore(
      Store<AppState> store, BuildContext context) {
    return SwitchRoleViewModel(
      token: store.state.userState.token,
      currentUser: store.state.userState.currentUser,
      currentIndex: store.state.userState.currentIndex,
      roleList: store.state.userState.roleList,
      getRoleList: () => store.dispatch(GetRoleListAction(context)),
      switchRole: (index) {
        store.dispatch(SwitchRoleAction(context, index));
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SwitchRoleViewModel &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          currentUser == other.currentUser &&
          currentIndex == other.currentIndex &&
          roleList == other.roleList &&
          getRoleList == other.getRoleList &&
          switchRole == other.switchRole;

  @override
  int get hashCode =>
      token.hashCode ^
      currentUser.hashCode ^
      currentIndex.hashCode ^
      roleList.hashCode ^
      getRoleList.hashCode ^
      switchRole.hashCode;
}
