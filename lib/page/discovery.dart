import 'package:flutter/material.dart';

import '../base/m_underline_tab_indicator.dart';
import '../model/event.dart';
import '../widget/search_bar.dart';
import '../widget/event_card.dart';

class DiscoveryPage extends StatefulWidget {
  DiscoveryPage({Key key}) : super(key: key);

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

double _kAppBarHeight = 177.0;

class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin<DiscoveryPage> {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    if (tabController == null) {
      tabController = TabController(vsync: this, length: 3);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFFF8F9FA),
        body: NestedScrollView(
          key: PageStorageKey<String>("discovery"),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _buildAppBar(context, innerBoxIsScrolled),
            ];
          },
          body: _buildBody(context),
        ),
      ),
    );
  }
}

Widget _buildAppBar(BuildContext context, bool innerBoxIsScrolled) {
  final double statusBarHeight = MediaQuery.of(context).padding.top;
  return SliverOverlapAbsorber(
    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
    child: SliverAppBar(
      pinned: true,
      forceElevated: innerBoxIsScrolled,
      backgroundColor: Colors.white,
      expandedHeight: _kAppBarHeight,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size size = constraints.biggest;
          final double appBarHeight = size.height - statusBarHeight;
          final double t = (appBarHeight - kToolbarHeight) /
              (_kAppBarHeight - kToolbarHeight);
          final double extraPadding = //20.0;
              Tween<double>(begin: 10.0, end: 20.0).lerp(t);
          final double logoHeight = appBarHeight - 1 * extraPadding;
          return Padding(
            padding: EdgeInsets.only(
              top: statusBarHeight + 0.5 * extraPadding,
            ),
            child: TopBar(
              t: t.clamp(0.0, 1.0),
            ),
          );
        },
      ),
    ),
  );
}

Widget _buildBody(BuildContext context) {
  return TabBarView(
    children: [
      _buildTab(context, 1),
      _buildTab(context, 2),
      _buildTab(context, 3),
    ],
  );
}

Event event = Event(
  userAvatar:
      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
  userName: "霹雳巴拉酱",
  eventType: 1,
  pictures: [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg",
//    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=927480163,3727066344&fm=27&gp=0.jpg",
//    "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3774731071,361198447&fm=27&gp=0.jpg",
//    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2233345096,4117074648&fm=27&gp=0.jpg",
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

Widget _buildTab(BuildContext context, int type) {
  return SafeArea(
    top: false,
    bottom: false,
    child: Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          key: PageStorageKey<String>("discovery" + type.toString()),
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return EventCard(event: event);
                  },
                  childCount: 30,
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}

class TopBar extends StatefulWidget {
  TopBar({
    this.t,
  });

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
      end: Rect.fromLTWH(0.0, 60.0, width, 45.0),
      begin: Rect.fromLTWH(0.0, 0.0, width, 45.0),
    );
    RectTween _tabBarTween = RectTween(
      end: Rect.fromLTWH(0.0, 122.0, width, 45.0),
      begin: Rect.fromLTWH(0.0, 6.0, width, 45.0),
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
                  "发现",
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
            child: Opacity(
              opacity: _textOpacity.transform(widget.t),
              child: Container(
                height: 45.0,
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: SearchBar(controller: _textController),
              ),
            ),
          ),
          Positioned.fromRect(
            rect: _tabBarTween.lerp(widget.t),
            child: Container(
              height: 50.0,
              width: 500.0,
              padding: EdgeInsets.only(right: 90.0),
              child: TabBar(
                indicator: MUnderlineTabIndicator(
                  insets: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Color(0xFF42BE56),
                  ),
                ),
                indicatorPadding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                tabs: [
                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "大杂烩",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF0D0E15),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "朋友在玩",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF0D0E15),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "热点",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF0D0E15),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
