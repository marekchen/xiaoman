import 'package:flutter/material.dart';

import '../model/event.dart';
import '../widget/event_card.dart';
import '../widget/search_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

double _kAppBarHeight = 140.0;

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFF8F9FA),
      body: CustomScrollView(
        key: PageStorageKey<String>("home"),
        slivers: <Widget>[
          _buildAppBar(context, statusBarHeight),
          _buildBody(context, statusBarHeight),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Widget _buildAppBar(BuildContext context, double statusBarHeight) {
  return SliverAppBar(
    pinned: true,
    backgroundColor: Colors.white,
    expandedHeight: _kAppBarHeight,
    flexibleSpace: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size size = constraints.biggest;
        final double appBarHeight = size.height - statusBarHeight;
        final double t =
            (appBarHeight - kToolbarHeight) / (_kAppBarHeight - kToolbarHeight);
        final double extraPadding =
            Tween<double>(begin: 10.0, end: 20.0).lerp(t);
        final double logoHeight = appBarHeight - extraPadding;
        return Padding(
          padding: EdgeInsets.only(
            top: statusBarHeight + 0.5 * extraPadding,
          ),
          child: TopBar(height: logoHeight, t: t.clamp(0.0, 1.0)),
        );
      },
    ),
  );
}

Widget _buildBody(BuildContext context, double statusBarHeight) {
  final EdgeInsets padding = EdgeInsets.only(top: 8.0, bottom: 8.0);
  return SliverPadding(
    padding: padding,
    sliver: SliverList(
      key: PageStorageKey<String>("home-list"),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final Widget item = list[index];
          return item;
        },
        childCount: list.length,
      ),
    ),
  );
}

Event event = Event(
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

Event event2 = Event(
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

Event event3 = Event(
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
  EventCard(event: event),
  EventCard(event: event2),
  EventCard(event: event3),
  EventCard(event: event),
  EventCard(event: event2),
  EventCard(event: event3),
];

class TopBar extends StatefulWidget {
  TopBar({this.height, this.t});

  final double height;
  final double t;

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final Curve _textOpacity = Interval(0.4, 1.0, curve: Curves.easeInOut);
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    RectTween _searchBarRectTween = RectTween(
      end: Rect.fromLTWH(0.0, 60.0, width, 45.0), //410
      begin: Rect.fromLTWH(0.0, 0.0, width, 45.0),
    );
    return SizedBox(
      width: width,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned.fromRect(
            rect: Rect.fromLTWH(0.0, 0.0, 100.0, 32.0),
            child: Opacity(
              opacity: _textOpacity.transform(widget.t),
              child: Container(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "首页",
                  style: TextStyle(
                    color: Color(0xFF0D0E15),
                    fontSize: 32.0,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fromRect(
            rect: _searchBarRectTween.lerp(widget.t),
            child: Container(
              height: 45.0,
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: SearchBar(controller: _textController),
            ),
          )
        ],
      ),
    );
  }
}
