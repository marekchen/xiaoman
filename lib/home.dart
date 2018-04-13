import 'package:flutter/material.dart';
import 'task.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: list,
    );
  }
}

List<Widget> list = <Widget>[
  new SearchBar(),
  new EventCard(),
  new EventCard(),
  new EventCard(),
  new EventCard(),
  new EventCard(),
  new EventCard(),
];

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => new _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: new Card(
        child: new Container(
          padding: new EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: new TextField(
            controller: _controller,
            decoration: new InputDecoration(
              hintText: '任务/文章/作者',
              icon: new Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
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
      padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: new Card(
        child: new Container(
          padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                      child: new Image.network(
                        "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    new Text(
                      "霹雳巴拉酱",
                      style: new TextStyle(color: Colors.grey),
                    ),
                    new Text(
                      " · ",
                      style: new TextStyle(color: Colors.grey),
                    ),
                    new Text(
                      "参加了任务：",
                      style: new TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              new Divider(),
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: new Text(
                  "我是任务标题，是啥任务咧，点我瞧瞧",
                  style: new TextStyle(fontSize: 16.0),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new TaskHome()),
                    );
                  },
                  child: new Text(
                    "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧",
                    style: new TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              new Divider(),
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Text(
                      "300 关注",
                      style: new TextStyle(color: Colors.grey),
                    ),
                    new Text(
                      " · ",
                      style: new TextStyle(color: Colors.grey),
                    ),
                    new Text(
                      "143 参与",
                      style: new TextStyle(color: Colors.grey),
                    )
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