import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:xiaoman/redux/app/app_state.dart';
import 'package:xiaoman/redux/user/user_actions.dart';

class LoginViewModel {
  LoginViewModel({
    @required this.token,
    @required this.func,
  });

  final Function func;

  final String token;

  static LoginViewModel fromStore(Store<AppState> store, BuildContext context) {
    return LoginViewModel(
      token: store.state.userState.token,
      func: () => store.dispatch(SetUserAction("1111", null)),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginViewModel &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          func == other.func;

  @override
  int get hashCode => token.hashCode ^ func.hashCode;
}
