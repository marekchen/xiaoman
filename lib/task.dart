import 'package:flutter/material.dart';
import 'package:xiaoman/base/m_underline_tab_indicator.dart';
import 'package:xiaoman/base/mcard.dart';

class TaskHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: new Color(0xFFE9ECEF)),
      home: new DefaultTabController(
        length: 3,
        child: new Scaffold(
          floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.border_color),
            backgroundColor: const Color(0xFF42BE56),
            onPressed: () {},
          ),
          appBar: new AppBar(
            backgroundColor: Colors.white,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 2.0,
            bottom: new TaskHeader(
              new TabBar(
                indicatorColor: const Color(0xFF42BE56),
                indicatorWeight: 3.0,
                indicator: new MUnderlineTabIndicator(
                  insets: new EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  borderSide: new BorderSide(
                    width: 3.0,
                    color: const Color(0xFF42BE56),
                  ),
                ),
                indicatorPadding: new EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                tabs: [
                  new Tab(
                    child: new Row(
                      children: <Widget>[
                        //new Icon(Icons.textsms),
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
                        //new Icon(Icons.voice_chat),
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
                        //new Icon(Icons.chat),
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
          ),
          body: new TabBarView(
            children: [
              new Icon(Icons.directions_car),
              new Icon(Icons.directions_transit),
              new Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskHeader extends StatefulWidget implements PreferredSizeWidget {
  TaskHeader(this.tabBar, {Key key}) : super(key: key);

  @override
  _TaskHeaderState createState() => new _TaskHeaderState();

  final TabBar tabBar;

  @override
  Size get preferredSize {
    return new Size.fromHeight(tabBar.preferredSize.height + 96.0);
  }
}

class _TaskHeaderState extends State<TaskHeader> {
  @override
  Widget build(BuildContext context) {
    Widget taskInfo = new Container(
      height: 98.0,
      padding: new EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
      child: new MCard(
        color: new Color(0xFFFFFFFF),
        radius: 8.0,
        child: new Container(
          padding: new EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: EdgeInsets.only(top: 8.0, bottom: 10.0),
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
                    new Row(
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
                    )
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
    return new Column(
      children: <Widget>[
        taskInfo,
        widget.tabBar,
//        new Material(
//          shadowColor: const Color(0x78CED4DA),
//          type: MaterialType.card,
//          elevation: 2.0,
//          borderRadius: new BorderRadius.only(
//            bottomLeft: new Radius.circular(12.0),
//            bottomRight: new Radius.circular(12.0),
//          ),
//          child: new Container(
//            decoration: new BoxDecoration(
//              color: Colors.white,
////              borderRadius: new BorderRadius.only(
////                bottomLeft: new Radius.circular(12.0),
////                bottomRight: new Radius.circular(12.0),
////              ),
//            ),
//            child: widget.tabBar,
//          ),
//        ),
      ],
    );
  }
}

class TaskTab extends StatefulWidget {
  TaskTab({Key key}) : super(key: key);

  @override
  _TaskTabState createState() => new _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            bottom: new TabBar(
              tabs: [
                new Tab(icon: new Icon(Icons.directions_car)),
                new Tab(icon: new Icon(Icons.directions_transit)),
                new Tab(icon: new Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: new TabBarView(
            children: [
              new Icon(Icons.directions_car),
              new Icon(Icons.directions_transit),
              new Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskTabArticle extends StatefulWidget {
  TaskTabArticle({Key key}) : super(key: key);

  @override
  _TaskTabArticleState createState() => new _TaskTabArticleState();
}

class _TaskTabArticleState extends State<TaskTabArticle> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: new Card(),
    );
  }
}
