import 'package:flutter/material.dart';
import 'package:xiaoman/base/m_underline_tab_indicator.dart';
import 'package:xiaoman/base/mcard.dart';
import 'package:xiaoman/model/article.dart';
import 'package:xiaoman/page/task_detail.dart';
import 'package:xiaoman/widget/article_card.dart';

class TaskHome extends StatefulWidget {
  TaskHome({Key key}) : super(key: key);

  @override
  _TaskHomeState createState() => new _TaskHomeState();
}

const double _kAppBarHeight = 200.0;

class _TaskHomeState extends State<TaskHome>
    with SingleTickerProviderStateMixin<TaskHome> {
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
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.border_color),
        backgroundColor: const Color(0xFF42BE56),
        onPressed: () {},
      ),
      backgroundColor: new Color(0xFFF8F9FA),
      body: new DefaultTabController(
        length: 3,
        child: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _buildAppBar(context, innerBoxIsScrolled, tabController),
            ];
          },
          body: _buildBody(context, tabController),
        ),
      ),
    );
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
          return new TopBar(
            statusBarHeight: statusBarHeight,
            controller: tabController,
            t: t.clamp(0.0, 1.0),
          );
        },
      ),
      bottom: new TabBar(
        indicator: new MUnderlineTabIndicator(
          insets: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          borderSide: new BorderSide(
            width: 3.0,
            color: const Color(0xFF42BE56),
          ),
        ),
        indicatorPadding: new EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        controller: tabController,
        tabs: [
          new Tab(
            child: new Row(
              children: <Widget>[
                new Text(
                  "手账",
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
                  "直播",
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
                  "群聊",
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
  );
}

class TopBar extends StatefulWidget {
  const TopBar({
    this.controller,
    this.statusBarHeight,
    this.t,
  });

  final TabController controller;
  final double statusBarHeight;
  final double t;

  @override
  _TopBarState createState() => new _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final Curve _textOpacity = const Interval(0.4, 1.0, curve: Curves.easeInOut);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    RectTween _backgroundRectTween = new RectTween(
      end: new Rect.fromLTWH(
          0.0, 0.0, width, _kAppBarHeight + widget.statusBarHeight - 45.0),
      begin: new Rect.fromLTWH(
          0.0, 0.0, width, _kAppBarHeight + widget.statusBarHeight - 45.0),
    );
    RectTween _taskHeaderRectTween = new RectTween(
      end: new Rect.fromLTWH(0.0, 75.0, width, 105.0),
      begin: new Rect.fromLTWH(0.0, 0.0, width, 105.0),
    );
    return new SizedBox(
      width: width,
      child: new Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          new Positioned.fromRect(
            rect: _backgroundRectTween.lerp(widget.t),
            child: new Opacity(
              opacity: _textOpacity.transform(widget.t),
              child: new Image.network(
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Positioned.fromRect(
            rect: _taskHeaderRectTween.lerp(widget.t),
            child: new Opacity(
              opacity: _textOpacity.transform(widget.t),
              child: new Container(
                height: 45.0,
                padding: new EdgeInsets.only(left: 16.0, right: 16.0),
                child: new TaskHeader(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskHeader extends StatefulWidget {
  TaskHeader({Key key}) : super(key: key);

  @override
  _TaskHeaderState createState() => new _TaskHeaderState();
}

class _TaskHeaderState extends State<TaskHeader> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 105.0,
      padding: new EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
      child: new MCard(
        color: new Color(0xFFFFFFFF),
        radius: 8.0,
        child: new Container(
          padding: new EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    height: 14.0,
                    width: 2.0,
                    color: const Color(0xFF42BE56),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(left: 4.0),
                    child: new Text(
                      "来自任务",
                      style: new TextStyle(
                        fontSize: 14.0,
                        color: const Color(0xFF768196),
                      ),
                    ),
                  ),
                ],
              ),
              new Padding(
                padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "从化暗夜公园观星",
                      style: new TextStyle(
                        fontSize: 16.0,
                        color: const Color(0xFF0D0E15),
                      ),
                    ),
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Text(
                            "查看任务",
                            style: new TextStyle(
                              fontSize: 14.0,
                              color: const Color(0xFF9DA4B3),
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.only(left: 2.0),
                            child: new Icon(
                              Icons.keyboard_arrow_right,
                              size: 14.0,
                              color: const Color(0xFF9DA4B3),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new TaskDetailPage(null)),
                          ),
                    ),
                  ],
                ),
              ),
              new Text(
                "18人参加此次任务",
                style: new TextStyle(
                  fontSize: 14.0,
                  color: const Color(0xFF9DA4B3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildBody(BuildContext context, TabController tabController) {
  return new TabBarView(
    children: [
      _buildTab(context, "article"),
      _buildTab(context, "streaming"),
      _buildTab(context, "chat"),
    ],
    controller: tabController,
  );
}

Widget _buildTab(BuildContext context, String type) {
  return new SafeArea(
    top: false,
    bottom: false,
    child: new Builder(
      builder: (BuildContext context) {
        return new CustomScrollView(
          key: new PageStorageKey<String>(type),
          slivers: <Widget>[
            new SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            new SliverPadding(
              padding: const EdgeInsets.only(top: 8.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ArticleCard(article: article);
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

Article article = new Article(
  userAvatar:
      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
  userName: "二逼欢乐多",
  content: "城里的月光把梦照亮，请温暖他心房，看透了人间聚散。",
  pictures: [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1665207864,746409922&fm=27&gp=0.jpg",
  ],
);
