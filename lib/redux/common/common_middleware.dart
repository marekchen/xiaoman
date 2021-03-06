import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux/redux.dart';
import 'package:xiaoman/app.dart';
import 'package:xiaoman/redux/common/common_actions.dart';
import '../app/app_state.dart';

class CommonMiddleware extends MiddlewareClass<AppState> {
  CommonMiddleware();

  @override
  Future<Null> call(
      Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (action is ShowToastAction) {
      _showToast(store, action, next);
    }
  }

  _showToast(Store<AppState> store, ShowToastAction action,
      NextDispatcher next) async {
    Fluttertoast.showToast(msg: action.msg);
  }
}
