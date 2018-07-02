import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux/redux.dart';
import '../networking/api.dart';
import './app/app_state.dart';
import './app/app_reducer.dart';
import './user/user_middleware.dart';

Future<Store<AppState>> createStore() async {
  var api = Api();
  var prefs = await SharedPreferences.getInstance();

  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [
      UserMiddleware(api, prefs),
    ],
  );
}
