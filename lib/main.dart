import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaoman/base/m_bottom_tab_bar.dart';
import 'package:xiaoman/page/discovery.dart';
import 'package:xiaoman/page/home.dart';
import 'package:xiaoman/page/message.dart';
import 'package:xiaoman/page/mine.dart';
import 'package:xiaoman/base/m_bottom_navigation_bar.dart';
import 'package:xiaoman/page/release.dart';
import 'package:xiaoman/page/test.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));

  var tabImages;
  var _body;
  var appBarTitles = ['首页', '发现', '发布', '消息', '我的'];

  Image getTabImage(path) {
    return new Image.asset(path, width: 30.0, height: 30.0);
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
    _body = new IndexedStack(
      children: <Widget>[
        new Home(),
        new Discovery(),
        new Release(),
        new MessagePage(),
        //new Test(),
        new Mine(),
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
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      theme: new ThemeData(primaryColor: const Color(0xFF63CA6C)),
      home: new Scaffold(
        body: _body,
        bottomNavigationBar: new MCupertinoTabBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabTitle(3)),
            new BottomNavigationBarItem(
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
    );
  }
}
//class _MyHomePageState extends State<MyHomePage>
//    with SingleTickerProviderStateMixin {
//  final List<BottomNavigationBarItem> items = [
//    new BottomNavigationBarItem(
//      icon: new ImageIcon(
//        const AssetImage(
//          'assets/tabbar_ic_home.png',
//        ),
//      ),
//      title: new Text('hone'),
//    ),
//    new BottomNavigationBarItem(
//      icon: new ImageIcon(
//        const AssetImage(
//          'assets/tabbar_ic_found.png',
//        ),
//      ),
//      title: new Text('found'),
//    ),
////    new BottomNavigationBarItem(
////      icon: new Icon(Icons.wrap_text),
////      title: new Text('write'),
////    ),
//    new BottomNavigationBarItem(
//      icon: new ImageIcon(
//        const AssetImage(
//          'assets/tabbar_ic_message.png',
//        ),
//      ),
//      title: new Text('message'),
//    ),
//    new BottomNavigationBarItem(
//      icon: new ImageIcon(
//        const AssetImage(
//          'assets/tabbar_ic_mine.png',
//        ),
//      ),
//      title: new Text('mine'),
//    ),
//  ];
//
//  PageController pageController;
//  int page = 0;
//
//  @override
//  void initState() {
//    super.initState();
//    pageController = new PageController(initialPage: this.page);
//  }
//
//  void onTap(int page) {
//    setState(() {
//      this.page = page;
//    });
//    pageController.animateToPage(page,
//        duration: const Duration(milliseconds: 300), curve: Curves.ease);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: new PageView(
//        controller: pageController,
//        children: [
//          new Home(),
//          new Discovery(),
////          new Release(),
//          new MessagePage(),
//          new Test(),
////          new Mine(),
//        ],
//        physics: new NeverScrollableScrollPhysics(),
//      ),
//      bottomNavigationBar: new MBottomNavigationBar(
//        items: items,
//        fixedColor: new Color(0xFF42BE56),
//        defaultColor: new Color(0xFF9DA4B3),
//        onTap: onTap,
//        currentIndex: page,
//      ),
//    );
//  }
//}
