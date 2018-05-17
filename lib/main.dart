import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaoman/page/discovery.dart';
import 'package:xiaoman/page/home.dart';
import 'package:xiaoman/page/mine.dart';
import 'package:xiaoman/base/m_bottom_navigation_bar.dart';

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
  TabController _pageController;

  int index = 0;

  void _selectTab(int index) {
    setState(() {
      this.index = index;
    });
    _pageController.animateTo(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = new TabController(vsync: this, length: items.length);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: [
          new Home(),
          new Discovery(),
          new Mine(),
          new Mine(),
          new Mine(),
        ],
        controller: _pageController,
        physics: new NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: new MBottomNavigationBar(
        items: items,
        fixedColor: new Color(0xFF42BE56),
        defaultColor: new Color(0xFF9DA4B3),
        onTap: _selectTab,
        currentIndex: index,
      ),
    );
  }
}
