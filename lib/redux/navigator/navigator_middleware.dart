import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:xiaoman/app.dart';
import 'package:xiaoman/redux/navigator/navigator_actions.dart';
import '../app/app_state.dart';

class CommonMiddleware extends MiddlewareClass<AppState> {
  CommonMiddleware();

  @override
  Future<Null> call(
      Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is NavigateToAction) {
      _navigatorTo(store, action, next);
    }
  }

  Future<Null> _navigatorTo(Store<AppState> store, NavigateToAction action,
      NextDispatcher next) async {
//    ApplicationRouter().router.navigateTo(
//      context,
//      "/setting",
//      transition: TransitionType.inFromRight,
//    );
  }

  Future<Null> _pop(Store<AppState> store, PopAction action,
      NextDispatcher next) async {
//    ApplicationRouter().router.navigateTo(context, path)
  }
}