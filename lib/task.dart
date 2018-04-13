import 'package:flutter/material.dart';

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
            backgroundColor: Colors.blue,
            onPressed: (){

            },
          ),
          appBar: new AppBar(
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            bottom: new TaskHeader(
              new TabBar(
                indicatorColor: Colors.grey,
                indicatorWeight: 3.0,
                indicatorPadding: new EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                tabs: [
                  new Tab(
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.textsms),
                        new Text("手账"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                  new Tab(
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.voice_chat),
                        new Text("直播"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                  new Tab(
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.chat),
                        new Text("群聊"),
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
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Second Screen"),
//      ),
//      body: new Center(
//        child: new Column(
//          children: <Widget>[
//            new TaskHeader(),
//            new TaskTab(),
//          ],
//        ),
//      ),
//    );
  }
}

class TaskHeader extends StatefulWidget implements PreferredSizeWidget {
  TaskHeader(this.tabBar, {Key key}) : super(key: key);

  @override
  _TaskHeaderState createState() => new _TaskHeaderState();

  final TabBar tabBar;

  @override
  Size get preferredSize {
    return new Size.fromHeight(tabBar.preferredSize.height + 110.0);
  }
}

class _TaskHeaderState extends State<TaskHeader> {
  @override
  Widget build(BuildContext context) {
    Widget taskInfo = new Container(
      height: 110.0,
      padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: new Card(
        child: new Container(
          padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.layers,
                    color: Colors.grey,
                  ),
                  new Text(
                    "来自任务",
                    style: new TextStyle(),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "从化暗夜公园观星",
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "查看任务",
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                      new Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                      ),
                    ],
                  )
                ],
              ),
              new Text(
                "18人参加此次任务",
                style: new TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
    return new Column(
      children: <Widget>[
        taskInfo,
        new Container(
          child: widget.tabBar,
          color: Colors.white,
        )
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
