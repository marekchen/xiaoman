import 'package:flutter/material.dart';
import 'package:xiaoman/widget/event_card.dart';
import 'package:xiaoman/widget/search_bar.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => new _HomeState();
}

const double _kAppBarHeight = 140.0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Scaffold(
      backgroundColor: new Color(0xFFF8F9FA),
      body: new CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(context, statusBarHeight),
          _buildBody(context, statusBarHeight),
        ],
      ),
    );
  }
}

Widget _buildAppBar(BuildContext context, double statusBarHeight) {
  return new SliverAppBar(
    pinned: true,
    backgroundColor: new Color(0xFFFFFFFF),
    expandedHeight: _kAppBarHeight,
    flexibleSpace: new LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size size = constraints.biggest;
        final double appBarHeight = size.height - statusBarHeight;
        final double t =
            (appBarHeight - kToolbarHeight) / (_kAppBarHeight - kToolbarHeight);
        final double extraPadding =
            new Tween<double>(begin: 10.0, end: 24.0).lerp(t);
        final double logoHeight = appBarHeight - 1.5 * extraPadding;
        return new Padding(
          padding: new EdgeInsets.only(
            top: statusBarHeight + 0.5 * extraPadding,
            bottom: extraPadding,
          ),
          child: new TopBar(height: logoHeight, t: t.clamp(0.0, 1.0)),
        );
      },
    ),
  );
}

Widget _buildBody(BuildContext context, double statusBarHeight) {
  final EdgeInsets padding = new EdgeInsets.only(top: 8.0, bottom: 8.0);
  return new SliverPadding(
    padding: padding,
    sliver: new SliverList(
      delegate: new SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final Widget item = list[index];
          return item;
        },
        childCount: list.length,
      ),
    ),
  );
}

List<Widget> list = <Widget>[
  //new SearchBar(),
  new EventCard(),
  new EventCard(),
  new EventCard(),
  new EventCard(),
  new EventCard(),
  new EventCard(),
  new Container(
    height: 50.0,
  )
];

class TopBar extends StatefulWidget {
  const TopBar({this.height, this.t});

  final double height;
  final double t;

  @override
  _TopBarState createState() => new _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final Curve _textOpacity = const Interval(0.4, 1.0, curve: Curves.easeInOut);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    RectTween _searchBarRectTween = new RectTween(
      end: new Rect.fromLTWH(0.0, 60.0, width, 45.0), //410
      begin: new Rect.fromLTWH(0.0, 0.0, width, 45.0),
    );
    return new SizedBox(
      width: 375.0,
      child: new Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          new Positioned.fromRect(
            rect: new Rect.fromLTWH(0.0, 0.0, 100.0, 32.0),
            child: new Opacity(
              opacity: _textOpacity.transform(widget.t),
              child: new Container(
                padding: new EdgeInsets.only(left: 16.0),
                child: new Text(
                  "首页",
                  style: new TextStyle(
                    color: new Color(0xFF0D0E15),
                    fontSize: 32.0,
                  ),
                ),
              ),
            ),
          ),
          new Positioned.fromRect(
            rect: _searchBarRectTween.lerp(widget.t),
            child: new Container(
              height: 45.0,
              padding: new EdgeInsets.only(left: 16.0, right: 16.0),
              child: new SearchBar(),
            ),
          )
        ],
      ),
    );
  }
}


