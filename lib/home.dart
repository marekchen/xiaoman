import 'package:flutter/material.dart';
import 'package:xiaoman/base/mcard.dart';
import 'task.dart';
import 'test.dart';

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

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => new _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new MCard(
      color: new Color(0xFFF3F4F6),
      radius: 8.0,
      child: new Container(
        padding: new EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
        child: new TextField(
          controller: _controller,
          decoration: new InputDecoration(
            hintText: '搜索',
            hintStyle: new TextStyle(
              color: new Color(0xFF768196),
              fontSize: 14.0,
            ),
            icon: new Icon(
              Icons.search,
              color: new Color(0xFF9DA4B3),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatefulWidget {
  EventCard({Key key}) : super(key: key);

  @override
  _EventCardState createState() => new _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
      child: new MCard(
        color: new Color(0xFFFFFFFF),
        child: new Container(
          padding: new EdgeInsets.fromLTRB(16.0, 17.0, 16.0, 12.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 6.0, 0.0),
                      child: new Image.network(
                        "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    new Text(
                      "霹雳巴拉酱",
                      style: new TextStyle(
                        color: new Color(0xff768196),
                        fontSize: 14.0,
                      ),
                    ),
                    new Text(
                      " · ",
                      style: new TextStyle(
                        color: new Color(0xff768196),
                        fontSize: 14.0,
                      ),
                    ),
                    new Text(
                      "参加了任务：",
                      style: new TextStyle(
                        color: new Color(0xff768196),
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              ),
              new Divider(height: 0.0, color: new Color(0xFFEFF0F2)),
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 8.0),
                child: new Text(
                  "我是任务标题，是啥任务咧，点我瞧瞧",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    color: new Color(0xFF0D0E15),
                    fontSize: 16.0,
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
                child: new InkWell(
                  onTap: () {
                    //Navigator.of(context).pushNamed('/task');
//                    Navigator.of(context).push(
//                          new MaterialPageRoute(
//                              builder: (context) => new TaskHome()),
//                        );
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new TaskHome()),
                    );
//                    Navigator.push(
//                      context,
//                      new MaterialPageRoute(builder: (context) => new SecondScreen()),
//                    );
                  },
                  child: new Text(
                    "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧",
                    style: new TextStyle(
                      color: new Color(0xFF0D0E15),
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              new Divider(height: 0.0, color: new Color(0xFFEFF0F2)),
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 0.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Text(
                      "300",
                      style: new TextStyle(
                        color: new Color(0xFF0D0E15),
                        fontSize: 14.0,
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                      child: new Text(
                        "关注",
                        style: new TextStyle(
                          color: new Color(0xFF768196),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: new Text(
                        "·",
                        style: new TextStyle(
                          color: new Color(0xFF768196),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    new Text(
                      "143",
                      style: new TextStyle(
                        color: new Color(0xFF0D0E15),
                        fontSize: 14.0,
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                      child: new Text(
                        "参与",
                        style: new TextStyle(
                          color: new Color(0xFF768196),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Entry> data = <Entry>[
  new Entry(
    'Chapter A',
    <Entry>[
      new Entry(
        'Section A0',
        <Entry>[
          new Entry('Item A0.1'),
          new Entry('Item A0.2'),
          new Entry('Item A0.3'),
        ],
      ),
      new Entry('Section A1'),
      new Entry('Section A2'),
    ],
  ),
  new Entry(
    'Chapter B',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry(
    'Chapter C',
    <Entry>[
      new Entry('Section C0'),
      new Entry('Section C1'),
      new Entry(
        'Section C2',
        <Entry>[
          new Entry('Item C2.0'),
          new Entry('Item C2.1'),
          new Entry('Item C2.2'),
          new Entry('Item C2.3'),
        ],
      ),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return new ListTile(title: new Text(root.title));
    return new ExpansionTile(
      key: new PageStorageKey<Entry>(root),
      title: new Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}
