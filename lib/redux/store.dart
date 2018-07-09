import 'dart:async';
import 'package:redux_epics/redux_epics.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:xiaoman/redux/common/common_middleware.dart';
import 'package:xiaoman/redux/user/user_epic.dart';
import 'package:xiaoman/redux/user/user_middleware.dart';
import '../networking/api.dart';
import './app/app_state.dart';
import './app/app_reducer.dart';

Future<Store<AppState>> createStore() async {
  var api = Api();
  var preferences = await SharedPreferences.getInstance();

  var epics = combineEpics([]);

  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [
      LoggingMiddleware.printer(),
      //EpicMiddleware(epics),
      UserMiddleware(api, preferences),
      CommonMiddleware(),
    ],
  );
}
