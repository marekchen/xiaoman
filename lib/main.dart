import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:xiaoman/app.dart';
import 'package:xiaoman/base/m_bottom_tab_bar.dart';
import 'package:xiaoman/redux/app/app_state.dart';
import 'package:xiaoman/redux/store.dart';
import 'package:xiaoman/redux/user/user_actions.dart';

import './page/discovery.dart';
import './page/home.dart';
import './page/message.dart';
import './page/mine.dart';
import './page/release.dart';
import './page/login.dart';

Future<Null> main() async {
  var store = await createStore();
  runApp(MyHomePage(store));
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.store);

  final Store<AppState> store;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;
  final tabTextStyleNormal = TextStyle(color: Color(0xff969696));
  final tabTextStyleSelected = TextStyle(color: Color(0xff63ca6c));

  var tabImages;
  var _body;
  var appBarTitles = ['首页', '发现', '发布', '消息', '我的'];

  Image getTabImage(path) {
    return Image.asset(path, width: 30.0, height: 30.0);
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('assets/tabbar_ic_home.png'),
          getTabImage('assets/tabbar_ic_home_active.png')
        ],
        [
          getTabImage('assets/tabbar_ic_found.png'),
          getTabImage('assets/tabbar_ic_found_active.png')
        ],
        [
          getTabImage('assets/tabbar_ic_write.png'),
          getTabImage('assets/tabbar_ic_write_active.png')
        ],
        [
          getTabImage('assets/tabbar_ic_message.png'),
          getTabImage('assets/tabbar_ic_message_active.png')
        ],
        [
          getTabImage('assets/tabbar_ic_mine.png'),
          getTabImage('assets/tabbar_ic_mine_active.png')
        ]
      ];
    }
    _body = IndexedStack(
      children: <Widget>[
        HomePage(),
        DiscoveryPage(),
        LoginPage(),
        MessagePage(),
        // Test(),
        MinePage(),
      ],
      index: _tabIndex,
    );
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  void initState() {
    super.initState();
    widget.store.dispatch(InitUserAction());
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        theme: ThemeData(primaryColor: Color(0xFF63CA6C)),
        home: Scaffold(
          body: _body,
          bottomNavigationBar: MCupertinoTabBar(
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: getTabIcon(0), title: getTabTitle(0)),
              BottomNavigationBarItem(
                  icon: getTabIcon(1), title: getTabTitle(1)),
              BottomNavigationBarItem(
                  icon: getTabIcon(2), title: getTabTitle(2)),
              BottomNavigationBarItem(
                  icon: getTabIcon(3), title: getTabTitle(3)),
              BottomNavigationBarItem(
                  icon: getTabIcon(4), title: getTabTitle(4)),
            ],
            currentIndex: _tabIndex,
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
          ),
        ),
        onGenerateRoute: App().router.generator,
      ),
    );
  }
}
