import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:xiaoman/model/user.dart';
import 'package:xiaoman/redux/app/app_state.dart';
import 'package:xiaoman/redux/user/user_actions.dart';

class MineViewModel {
  MineViewModel(
      {@required this.token,
      @required this.currentUser,
      @required this.getRoleList});

  final String token;
  final User currentUser;
  final Function getRoleList;

  static MineViewModel fromStore(Store<AppState> store, BuildContext context) {
    return MineViewModel(
      token: store.state.userState.token,
      currentUser: store.state.userState.currentUser,
      getRoleList: () => store.dispatch(GetRoleListAction(context)),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MineViewModel &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          currentUser == other.currentUser &&
          getRoleList == other.getRoleList;

  @override
  int get hashCode =>
      token.hashCode ^ currentUser.hashCode ^ getRoleList.hashCode;
}
