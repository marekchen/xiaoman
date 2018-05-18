import 'package:flutter/material.dart';
import 'package:xiaoman/model/event.dart';
import 'package:xiaoman/widget/event_card.dart';
import 'package:xiaoman/widget/search_bar.dart';

class Home extends StatefulWidget {

  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => new _HomeState();
}

const double _kAppBarHeight = 140.0;

class _HomeState extends State<Home> {

//  AutomaticKeepAliveClientMixin
//  PageStorageBucket
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: new Color(0xFFF8F9FA),
      body: new CustomScrollView(
        key: new PageStorageKey<String>("home"),
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
    backgroundColor: Colors.white,
    expandedHeight: _kAppBarHeight,
    flexibleSpace: new LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size size = constraints.biggest;
        final double appBarHeight = size.height - statusBarHeight;
        final double t =
            (appBarHeight - kToolbarHeight) / (_kAppBarHeight - kToolbarHeight);
        final double extraPadding =
            new Tween<double>(begin: 10.0, end: 20.0).lerp(t);
        final double logoHeight = appBarHeight - extraPadding;
        return new Padding(
          padding: new EdgeInsets.only(
            top: statusBarHeight + 0.5 * extraPadding,
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
      key: new PageStorageKey<String>("home-list"),
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

Event event = new Event(
  userAvatar:
      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
  userName: "霹雳巴拉酱",
  eventType: 1,
  pictures: [
//    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg",
//    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=927480163,3727066344&fm=27&gp=0.jpg",
//    "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3774731071,361198447&fm=27&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2233345096,4117074648&fm=27&gp=0.jpg",
  ],
  title: "我是任务标题，是啥任务咧，点我瞧瞧",
  body: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧",
  followNum: 300,
  joinNum: 143,
);

Event event2 = new Event(
  userAvatar:
      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
  userName: "霹雳222",
  eventType: 2,
  pictures: [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1665207864,746409922&fm=27&gp=0.jpg",
  ],
  title: "我是任务标题，是啥任务咧，22222",
  body: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧",
  likeNum: 1000,
  commentNum: 143,
);

Event event3 = new Event(
  userAvatar:
      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
  userName: "霹雳333333",
  eventType: 3,
  pictures: [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1665207864,746409922&fm=27&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=426595056,3152484396&fm=27&gp=0.jpg",
  ],
  title: "我是任务标题，是啥任务咧，333333",
  body: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧",
  likeNum: 1000,
  commentNum: 143,
);

List<Widget> list = <Widget>[
  new EventCard(event: event),
  new EventCard(event: event2),
  new EventCard(event: event3),
  new EventCard(event: event),
  new EventCard(event: event2),
  new EventCard(event: event3),
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
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    RectTween _searchBarRectTween = new RectTween(
      end: new Rect.fromLTWH(0.0, 60.0, width, 45.0), //410
      begin: new Rect.fromLTWH(0.0, 0.0, width, 45.0),
    );
    return new SizedBox(
      width: width,
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
              child: new SearchBar(controller: _textController),
            ),
          )
        ],
      ),
    );
  }
}
