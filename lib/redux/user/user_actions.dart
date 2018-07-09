import 'package:flutter/widgets.dart';

import '../../model/user.dart';

class InitUserAction {
}

class SetUserAction {
  SetUserAction( this.token, this.currentUser);

  final String token;
  final User currentUser;
}

class TestAction {
}

class LoginSuccessAction {
  LoginSuccessAction(this.context, this.token, this.currentUser);

  final BuildContext context;
  final String token;
  final User currentUser;
}

class LoginWithVerifyCodeAction {
  LoginWithVerifyCodeAction(this.context, this.mobile, this.verifyCode);

  final BuildContext context;
  final String mobile;
  final String verifyCode;
}

class LoginWithThirdAction {
  LoginWithThirdAction(this.context, this.unionid, this.type, this.avatar,
      this.nickname, this.gender);

  final BuildContext context;
  final String unionid;
  final int type;
  final String avatar;
  final String nickname;
  final int gender;
}

class UpdateUserAction {
  UpdateUserAction(this.currentUser);

  final User currentUser;
}


class ChangeUserAction {
  ChangeUserAction(this.context, this.token, this.currentUser);

  final BuildContext context;
  final String token;
  final User currentUser;
}

class LogoutAction {
  LogoutAction(this.context);

  final BuildContext context;
}
