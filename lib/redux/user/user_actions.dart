import 'package:flutter/widgets.dart';
import 'package:xiaoman/model/user.dart';

class InitUserAction {}

class SetUserAction {
  SetUserAction(this.token, this.currentUser);

  final String token;
  final User currentUser;
}

class LoginWithVerifyCodeAction {
  LoginWithVerifyCodeAction(this.context, this.mobile, this.verifyCode);

  final BuildContext context;
  final String mobile;
  final String verifyCode;
}

class LoginWithVerifyCodeSuccessAction {
  LoginWithVerifyCodeSuccessAction(this.context, this.token, this.currentUser);

  final BuildContext context;
  final String token;
  final User currentUser;
}

class LoginWithVerifyCodeFailedAction {
  LoginWithVerifyCodeFailedAction();
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

class LoginWithThirdSuccessAction {
  LoginWithThirdSuccessAction(this.context, this.token, this.currentUser);

  final BuildContext context;
  final String token;
  final User currentUser;
}

class LoginWithThirdFailedAction {
  LoginWithThirdFailedAction();
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

class GetRoleListAction {
  GetRoleListAction(this.context);

  final BuildContext context;
}

class GetRoleListSuccessAction {
  GetRoleListSuccessAction(this.roleList);

  final List<User> roleList;
}

class SwitchRoleAction {
  SwitchRoleAction(this.context, this.index);

  final BuildContext context;
  final int index;
}

class SwitchRoleSuccessAction {
  SwitchRoleSuccessAction(this.context, this.token, this.currentUser,this.currentIndex);

  final BuildContext context;
  final String token;
  final User currentUser;
  final int currentIndex;
}

class AddRoleAction {
  AddRoleAction(this.context, this.avatar, this.nickname, this.gender);

  final BuildContext context;
  final String avatar;
  final String nickname;
  final String gender;
}

class AddRoleSuccessAction {
  AddRoleSuccessAction(this.context, this.user);

  final BuildContext context;
  final User user;
}
