import 'package:flutter/material.dart';
import 'package:xiaoman/base/m_underline_tab_indicator.dart';
import 'package:xiaoman/model/event.dart';
import 'package:xiaoman/widget/search_bar.dart';
import 'package:xiaoman/widget/event_card.dart';

class Discovery extends StatefulWidget {
  Discovery({Key key}) : super(key: key);

  @override
  _DiscoveryState createState() => new _DiscoveryState();
}

const double _kAppBarHeight = 177.0;

class _DiscoveryState extends State<Discovery>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    if (tabController == null) {
      tabController = new TabController(vsync: this, length: 3);
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: new Color(0xFFF8F9FA),
        body: new DefaultTabController(
          length: 3,
          child: new NestedScrollView(
            key: new PageStorageKey<String>("discovery"),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                _buildAppBar(context, innerBoxIsScrolled, tabController),
              ];
            },
            body: _buildBody(
                context, tabController), //_tabs.map((String name) {}).toList(),
          ),
        ));
  }
}

Widget _buildAppBar(BuildContext context, bool innerBoxIsScrolled,
    TabController tabController) {
  final double statusBarHeight = MediaQuery.of(context).padding.top;
  return new SliverOverlapAbsorber(
    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
    child: new SliverAppBar(
      pinned: true,
      forceElevated: innerBoxIsScrolled,
      backgroundColor: Colors.white,
      expandedHeight: _kAppBarHeight,
      flexibleSpace: new LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size size = constraints.biggest;
          final double appBarHeight = size.height - statusBarHeight;
          final double t = (appBarHeight - kToolbarHeight) /
              (_kAppBarHeight - kToolbarHeight);
          final double extraPadding = //20.0;
              new Tween<double>(begin: 10.0, end: 20.0).lerp(t);
          final double logoHeight = appBarHeight - 1 * extraPadding;
          return new Padding(
            padding: new EdgeInsets.only(
              top: statusBarHeight + 0.5 * extraPadding,
            ),
            child: new TopBar(
              controller: tabController,
              height: logoHeight,
              t: t.clamp(0.0, 1.0),
            ),
          );
        },
      ),
    ),
  );
}

Widget _buildBody(BuildContext context, TabController tabController) {
  return new TabBarView(
    controller: tabController,
    children: [
      _buildTab(context, 1),
      _buildTab(context, 2),
      _buildTab(context, 3),
    ],
  );
}

Event event = new Event(
  userAvatar:
      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
  userName: "霹雳巴拉酱",
  eventType: 1,
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
  title: "我是任务标题，是啥任务咧，22222",
  body: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧",
  likeNum: 300,
  commentNum: 143,
);

Widget _buildTab(BuildContext context, int type) {
  return new SafeArea(
    top: false,
    bottom: false,
    child: new Builder(
      builder: (BuildContext context) {
        return new CustomScrollView(
          key: new PageStorageKey<String>("discovery" + type.toString()),
          slivers: <Widget>[
            new SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            new SliverPadding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
  const TopBar({
    this.controller,
    this.height,
    this.t,
  });

  final TabController controller;
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
      end: new Rect.fromLTWH(0.0, 60.0, width, 45.0),
      begin: new Rect.fromLTWH(0.0, 0.0, width, 45.0),
    );
    RectTween _tabBarTween = new RectTween(
      end: new Rect.fromLTWH(0.0, 122.0, width, 45.0),
      begin: new Rect.fromLTWH(0.0, 6.0, width, 45.0),
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
                  "发现",
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
            child: new Opacity(
              opacity: _textOpacity.transform(widget.t),
              child: new Container(
                height: 45.0,
                padding: new EdgeInsets.only(left: 16.0, right: 16.0),
                child: new SearchBar(controller: _textController),
              ),
            ),
          ),
          new Positioned.fromRect(
            rect: _tabBarTween.lerp(widget.t),
            child: new Container(
              height: 50.0,
              width: 500.0,
              padding: new EdgeInsets.only(right: 90.0),
              child: new TabBar(
                indicator: new MUnderlineTabIndicator(
                  insets: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  borderSide: new BorderSide(
                    width: 3.0,
                    color: const Color(0xFF42BE56),
                  ),
                ),
                indicatorPadding: new EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                controller: widget.controller,
                tabs: [
                  new Tab(
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          "大杂烩",
                          style: new TextStyle(
                            fontSize: 16.0,
                            color: const Color(0xFF0D0E15),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                  new Tab(
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          "朋友在玩",
                          style: new TextStyle(
                            fontSize: 16.0,
                            color: const Color(0xFF0D0E15),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                  new Tab(
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          "热点",
                          style: new TextStyle(
                            fontSize: 16.0,
                            color: const Color(0xFF0D0E15),
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
