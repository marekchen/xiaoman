import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaoman/page/discovery.dart';
import 'package:xiaoman/page/home.dart';
import 'package:xiaoman/page/mine.dart';
import 'package:xiaoman/base/m_bottom_navigation_bar.dart';
import 'package:xiaoman/page/release.dart';
import 'package:xiaoman/page/task_detail.dart';
import 'package:xiaoman/page/test.dart';
import 'package:xiaoman/page/test2.dart';

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
      icon: new Icon(Icons.directions_bike),
      title: new Text('Bicycle'),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(Icons.directions_boat),
      title: new Text('Boat'),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(Icons.directions_bus),
      title: new Text('Bus'),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(Icons.directions_railway),
      title: new Text('Train'),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(Icons.directions_railway),
      title: new Text('Train'),
    ),
  ];

//  final List<Tab> tabs = [
//    new Tab(
//      icon: new Icon(Icons.directions_bike, size: 30.0),
//    ),
//    new Tab(
//      icon: new Icon(Icons.directions_boat, size: 30.0),
//    ),
//    new Tab(
//      icon: new Icon(Icons.directions_bus, size: 30.0),
//    ),
//    new Tab(
//      icon: new Icon(Icons.directions_railway, size: 30.0),
//    ),
//    new Tab(
//      icon: new Icon(Icons.directions_railway, size: 30.0),
//    ),
//  ];

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
          new Release(),
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
