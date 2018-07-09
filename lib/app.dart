import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xiaoman/networking/api.dart';

import './page/setting.dart';

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
  }

  // handlers
  var settingHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SettingPage();
  });
}
