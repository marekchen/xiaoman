import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:xiaoman/model/user.dart';
import 'package:xiaoman/redux/app/app_state.dart';
import 'package:xiaoman/redux/user/user_actions.dart';

class PersonalInfoViewModel {
  PersonalInfoViewModel(
      {@required this.token,
      @required this.currentUser,
      @required this.logout});

  final String token;
  final User currentUser;
  final Function logout;

  static PersonalInfoViewModel fromStore(
      Store<AppState> store, BuildContext context) {
    return PersonalInfoViewModel(
      token: store.state.userState.token,
      currentUser: store.state.userState.currentUser,
      logout: () => store.dispatch(LogoutAction(context)),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalInfoViewModel &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          currentUser == other.currentUser &&
          logout == other.logout;

  @override
  int get hashCode => token.hashCode ^ currentUser.hashCode ^ logout.hashCode;
}
