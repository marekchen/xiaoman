import 'dart:async';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../networking/api.dart';
import '../user/user_actions.dart';
import '../app/app_state.dart';

class UserMiddleware extends MiddlewareClass<AppState> {

  final Api api;

  final SharedPreferences preferences;

  UserMiddleware(this.api, this.preferences);

  @override
  Future<Null> call(Store<AppState> store, dynamic action,
      NextDispatcher next) async {
    if (action is GetVerifyCodeAction) {
      _getVerifyCode(store, action, next);
    }
  }

  Future<bool> _getVerifyCode(Store<AppState> store, GetVerifyCodeAction action,
      NextDispatcher next) async {
    var mobile = action.mobile;
    var success = await api.getVerifyCode(mobile);
    return success;
  }
}
