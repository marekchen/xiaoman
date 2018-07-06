import 'dart:async';
import 'package:redux_epics/redux_epics.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux/redux.dart';
import 'package:xiaoman/redux/common/common_middleware.dart';
import 'package:xiaoman/redux/user/user_epic.dart';
import '../networking/api.dart';
import './app/app_state.dart';
import './app/app_reducer.dart';
import './user/user_middleware.dart';

Future<Store<AppState>> createStore() async {

  var epics = combineEpics([
    userEpic,
  ]);

  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [EpicMiddleware(epics), CommonMiddleware()],
  );
}
