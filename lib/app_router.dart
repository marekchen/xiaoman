import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:xiaoman/page/setting.dart';

class ApplicationRouter {
  static final ApplicationRouter _instance = new ApplicationRouter._internal();
  final Router _router = new Router(); // global router

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
    _router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
        });
    _router.define("setting", handler: settingHandler);
  }

  // handlers
  var settingHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return new SettingPage();
      });

}