import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:xiaoman/redux/app/app_state.dart';
import 'package:xiaoman/redux/user/user_actions.dart';

class LoginPhoneViewModel {
  LoginPhoneViewModel({
    @required this.loginWithVerifyCode,
  });

  final Function loginWithVerifyCode;

  static LoginPhoneViewModel fromStore(
      Store<AppState> store, BuildContext context) {
    return LoginPhoneViewModel(
      loginWithVerifyCode: (String mobile, String verifyCode) => store
          .dispatch(LoginWithVerifyCodeAction(context, mobile, verifyCode)),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LoginPhoneViewModel &&
              runtimeType == other.runtimeType &&
              loginWithVerifyCode == other.loginWithVerifyCode;

  @override
  int get hashCode => loginWithVerifyCode.hashCode;
}
