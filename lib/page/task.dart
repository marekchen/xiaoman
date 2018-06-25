import 'package:flutter/material.dart';

import '../base/m_underline_tab_indicator.dart';
import '../base/mcard.dart';
import '../model/article.dart';
import '../widget/article_card.dart';

import './task_detail.dart';

class TaskHome extends StatefulWidget {
  TaskHome({Key key}) : super(key: key);

  @override
  _TaskHomeState createState() => _TaskHomeState();
}

double _kAppBarHeight = 200.0;

class _TaskHomeState extends State<TaskHome>
    with SingleTickerProviderStateMixin<TaskHome> {
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
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.border_color),
        backgroundColor: Color(0xFF42BE56),
        onPressed: () {},
      ),
      backgroundColor: Color(0xFFF8F9FA),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
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
          return TopBar(
            statusBarHeight: statusBarHeight,
            controller: tabController,
            t: t.clamp(0.0, 1.0),
          );
        },
      ),
      bottom: TabBar(
        indicator: MUnderlineTabIndicator(
          insets: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          borderSide: BorderSide(
            width: 3.0,
            color: Color(0xFF42BE56),
          ),
        ),
        indicatorPadding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        controller: tabController,
        tabs: [
          Tab(
            child: Row(
              children: <Widget>[
                Text(
                  "手账",
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
                  "直播",
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
                  "群聊",
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
  );
}

class TopBar extends StatefulWidget {
  TopBar({
    this.controller,
    this.statusBarHeight,
    this.t,
  });

  final TabController controller;
  final double statusBarHeight;
  final double t;

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final Curve _textOpacity = Interval(0.4, 1.0, curve: Curves.easeInOut);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    RectTween _backgroundRectTween = RectTween(
      end: Rect.fromLTWH(
          0.0, 0.0, width, _kAppBarHeight + widget.statusBarHeight - 45.0),
      begin: Rect.fromLTWH(
          0.0, 0.0, width, _kAppBarHeight + widget.statusBarHeight - 45.0),
    );
    RectTween _taskHeaderRectTween = RectTween(
      end: Rect.fromLTWH(0.0, 75.0, width, 105.0),
      begin: Rect.fromLTWH(0.0, 0.0, width, 105.0),
    );
    return SizedBox(
      width: width,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned.fromRect(
            rect: _backgroundRectTween.lerp(widget.t),
            child: Opacity(
              opacity: _textOpacity.transform(widget.t),
              child: Image.network(
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fromRect(
            rect: _taskHeaderRectTween.lerp(widget.t),
            child: Opacity(
              opacity: _textOpacity.transform(widget.t),
              child: Container(
                height: 45.0,
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: TaskHeader(),
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
  _TaskHeaderState createState() => _TaskHeaderState();
}

class _TaskHeaderState extends State<TaskHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.0,
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
      child: MCard(
        color: Color(0xFFFFFFFF),
        radius: 8.0,
        child: Container(
          padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 14.0,
                    width: 2.0,
                    color: Color(0xFF42BE56),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      "来自任务",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF768196),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "从化暗夜公园观星",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF0D0E15),
                      ),
                    ),
                    InkWell(
                      child: Row(
                        children: <Widget>[
                          Text(
                            "查看任务",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF9DA4B3),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: 14.0,
                              color: Color(0xFF9DA4B3),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TaskDetailPage(null)),
                          ),
                    ),
                  ],
                ),
              ),
              Text(
                "18人参加此次任务",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF9DA4B3),
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
  return TabBarView(
    children: [
      _buildTab(context, "article"),
      _buildTab(context, "streaming"),
      _buildTab(context, "chat"),
    ],
    controller: tabController,
  );
}

Widget _buildTab(BuildContext context, String type) {
  return SafeArea(
    top: false,
    bottom: false,
    child: Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          key: PageStorageKey<String>(type),
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 8.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
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

Article article = Article(
  userAvatar:
      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
  userName: "二逼欢乐多",
  content: "城里的月光把梦照亮，请温暖他心房，看透了人间聚散。",
  pictures: [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1665207864,746409922&fm=27&gp=0.jpg",
  ],
);
