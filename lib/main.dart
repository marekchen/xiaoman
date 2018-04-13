import 'package:flutter/material.dart';
import 'home.dart';

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
  Choice _selectedChoice = choices[0];
  num _selectedIndex = 0;

  void _select(Choice choice, num index) {
    setState(() {
      _selectedChoice = choice;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: null,
        // body: new Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: new ChoiceCard(choice: _selectedChoice, index: _selectedIndex),
        // ),
        body: new ChoiceCard(choice: _selectedChoice, index: _selectedIndex),
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: new Icon(choices[0].icon),
              title: new Text(choices[0].title),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(choices[1].icon),
              title: new Text(choices[1].title),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(choices[2].icon),
              title: new Text(choices[2].title),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(choices[3].icon),
              title: new Text(choices[3].title),
            )
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (x) => _select(choices[x], x),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  //const Choice(title: 'Car', icon: const IconData(0xe6ad, fontFamily: 'ali')),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice, this.index}) : super(key: key);

  final Choice choice;
  final num index;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    Widget widget;
    switch (index) {
      case 0:
        widget = new Home();
        break;
      default:
        widget = new Card(
          color: Colors.white,
          child: new Center(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Icon(choice.icon, size: 128.0, color: textStyle.color),
                new Text(choice.title, style: textStyle),
              ],
            ),
          ),
        );
    }
    return widget;
  }
}
