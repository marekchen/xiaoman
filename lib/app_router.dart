import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import './page/setting.dart';

class ApplicationRouter {
  static final ApplicationRouter _instance = ApplicationRouter._internal();
  final Router _router = Router(); // global router

  factory ApplicationRouter() {
    return _instance;
  }

  ApplicationRouter._internal() {
    _configureRoutes();
  }

  // singleton
  Router get router {
    return _router;
  }

  void _configureRoutes() {
    _router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    _router.define("setting", handler: settingHandler);
  }

  // handlers
  var settingHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SettingPage();
  });
}
