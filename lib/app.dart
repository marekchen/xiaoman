import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xiaoman/main.dart';
import 'package:xiaoman/networking/api.dart';
import 'package:xiaoman/page/login.dart';
import 'package:xiaoman/page/login_phone.dart';
import 'package:xiaoman/page/my_follow.dart';
import 'package:xiaoman/page/my_wallet.dart';
import 'package:xiaoman/page/personal_info.dart';
import 'package:xiaoman/page/setting.dart';
import 'package:xiaoman/page/switch_role.dart';

class App {
  static final App _instance = App._internal();
  final Router _router = Router(); // global router
  final _api = Api();
  final _prefs = SharedPreferences.getInstance();

  factory App() {
    return _instance;
  }

  App._internal() {
    _configureRoutes();
  }

  Router get router {
    return _router;
  }

  Api get api {
    return _api;
  }

  Future<SharedPreferences> get prefs {
    return _prefs;
  }

  void _configureRoutes() {
    _router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    _router.define("setting", handler: settingHandler);
    _router.define("login", handler: loginHandler);
    _router.define("loginPhone", handler: loginPhoneHandler);
    _router.define("personalInfo", handler: personalInfoHandler);
    _router.define("myFollow", handler: myFollowHandler);
    _router.define("myWallet", handler: myWalletHandler);
    _router.define("switchRole", handler: switchRoleHandler);
  }

  var settingHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SettingPage();
  });
  var loginHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginPage();
  });
  var loginPhoneHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginPhonePage();
  });
  var personalInfoHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PersonalInfo();
  });
  var myFollowHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MyFollow();
  });
  var myWalletHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MyWallet();
  });
  var switchRoleHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SwitchRolePage();
  });
}
