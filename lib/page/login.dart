import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:xiaoman/app.dart';
import 'package:xiaoman/base/m_modal_progress.dart';
import 'package:xiaoman/model/user.dart';
import 'package:xiaoman/redux/app/app_state.dart';

class LoginViewModel {
  LoginViewModel({
    @required this.token,
    @required this.user,
    @required this.loginLoading,
    @required this.loginWithThird,
  });

  final User user;
  final String token;

  final bool loginLoading;
  final Function loginWithThird;

  static LoginViewModel fromStore(Store<AppState> store, BuildContext context) {
    return LoginViewModel(
      token: store.state.userState.token,
      user: store.state.userState.currentUser,
      loginLoading: store.state.userState.loginLoading,
      loginWithThird: () => {},
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginViewModel &&
          runtimeType == other.runtimeType &&
          user == other.user &&
          token == other.token &&
          loginLoading == other.loginLoading &&
          loginWithThird == other.loginWithThird;

  @override
  int get hashCode =>
      token.hashCode ^
      user.hashCode ^
      loginLoading.hashCode ^
      loginWithThird.hashCode;
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
      distinct: true,
      converter: (store) => LoginViewModel.fromStore(store, context),
      builder: (_, viewModel) => LoginPageContent(viewModel),
    );
  }
}

class LoginPageContent extends StatelessWidget {
  LoginPageContent(this.viewModel);

  LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return MModalProgress(
      inAsyncCall: viewModel.loginLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF0D0E15),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 56.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                child: Image.asset(
                  "assets/logo.png",
                  height: 120.0,
                  width: 120.0,
                ),
              ),
            ),
            Positioned(
              bottom: 100.0,
              left: 0.0,
              right: 0.0,
              child: Column(
                children: <Widget>[
                  CupertinoButton(
                    child: Text('手机号登录/注册'),
                    color: Color(0xFF42BE56),
                    pressedOpacity: 0.2,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0),
                    minSize: 30.0,
                    borderRadius: BorderRadius.all(Radius.circular(22.0)),
                    onPressed: () {
                      App().router.navigateTo(
                            context,
                            "/loginPhone",
                            transition: TransitionType.inFromRight,
                          );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 43.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                "assets/ic_wechat.png",
                                height: 32.0,
                                width: 32.0,
                              ),
                              Text(
                                "微信登录",
                                style: TextStyle(
                                    color: Color(0xFF838EA0), fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                "assets/ic_qq.png",
                                height: 32.0,
                                width: 32.0,
                              ),
                              Text(
                                "QQ",
                                style: TextStyle(
                                    color: Color(0xFF838EA0), fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
