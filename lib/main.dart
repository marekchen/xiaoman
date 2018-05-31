import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaoman/page/discovery.dart';
import 'package:xiaoman/page/home.dart';
import 'package:xiaoman/page/mine.dart';
import 'package:xiaoman/base/m_bottom_navigation_bar.dart';
import 'package:xiaoman/page/release.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<BottomNavigationBarItem> items = [
    new BottomNavigationBarItem(
      icon: new ImageIcon(
        const AssetImage(
          'assets/tabbar_ic_home.png',
        ),
      ),
      title: new Text('hone'),
    ),
    new BottomNavigationBarItem(
      icon: new ImageIcon(
        const AssetImage(
          'assets/tabbar_ic_found.png',
        ),
      ),
      title: new Text('found'),
    ),
//    new BottomNavigationBarItem(
//      icon: new Icon(Icons.wrap_text),
//      title: new Text('write'),
//    ),
    new BottomNavigationBarItem(
      icon: new ImageIcon(
        const AssetImage(
          'assets/tabbar_ic_message.png',
        ),
      ),
      title: new Text('message'),
    ),
    new BottomNavigationBarItem(
      icon: new ImageIcon(
        const AssetImage(
          'assets/tabbar_ic_mine.png',
        ),
      ),
      title: new Text('mine'),
    ),
  ];

  PageController pageController;
  int page = 0;

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  void onTap(int page) {
    setState(() {
      this.page = page;
    });
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView(
        controller: pageController,
        children: [
          new Home(),
          new Discovery(),
//          new Release(),
          new Release(),
          new Mine(),
        ],
        physics: new NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: new MBottomNavigationBar(
        items: items,
        fixedColor: new Color(0xFF42BE56),
        defaultColor: new Color(0xFF9DA4B3),
        onTap: onTap,
        currentIndex: page,
      ),
    );
  }
}
