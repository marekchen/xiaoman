import 'package:flutter/material.dart';
import 'package:xiaoman/base/m_underline_tab_indicator.dart';
import 'package:xiaoman/model/task.dart';

class MyFollow extends StatefulWidget {
  MyFollow({Key key}) : super(key: key);

  @override
  _MyFollowState createState() => new _MyFollowState();
}

class _MyFollowState extends State<MyFollow> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: new Color(0xFFE9ECEF)),
      home: new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            centerTitle: true,
            title: new Text(
              "我的关注",
              style: new TextStyle(
                fontSize: 18.0,
                color: const Color(0xFF0D0E15),
              ),
            ),
            backgroundColor: Colors.white,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 1.0,
            bottom: new TabBar(
              indicator: new MUnderlineTabIndicator(
                insets: new EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 0.0),
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
                      new Text(
                        "用户",
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
                        "任务",
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
          body: new TabBarView(
            children: [
              new ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    new UserInfoCard(list[index]),
                itemCount: list.length,
              ),
              new ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    new TaskCard(taskList[index]),
                itemCount: taskList.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfo {
  const UserInfo({this.name, this.avatar});

  final String name;
  final String avatar;
}

const List<Task> taskList = const <Task>[
  const Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧",
  ),
  const Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  const Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  const Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  const Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  const Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  const Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  const Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  const Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  const Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  const Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
];

const List<UserInfo> list = const <UserInfo>[
  const UserInfo(
      name: "毛莎莎",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  const UserInfo(
      name: "吴亦凡",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  const UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  const UserInfo(
      name: "王火种",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  const UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  const UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  const UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  const UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  const UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  const UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  const UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  const UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  const UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
];

class UserInfoCard extends StatelessWidget {
  const UserInfoCard(this.userInfo);

  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 61.0,
      color: Colors.white,
      padding: new EdgeInsets.symmetric(horizontal: 16.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Container(
            height: 60.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                      height: 32.0,
                      width: 32.0,
                      child: new ClipRRect(
                        borderRadius: new BorderRadius.circular(4.0),
                        child: new Image.network(
                          userInfo.avatar,
                          fit: BoxFit.fitHeight,
                          //alignment: Alignment.topLeft,
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(left: 10.0),
                      child: new Text(
                        userInfo.name,
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: const Color(0xFF0D0E15),
                        ),
                      ),
                    ),
                  ],
                ),
                new Text(
                  "已关注",
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: const Color(0xFF768196),
                  ),
                ),
              ],
            ),
          ),
          new Divider(
            height: 1.0,
            color: const Color(0xFFF3F4F6),
          )
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      padding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      margin: new EdgeInsets.only(bottom: 1.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            task.title,
            style: new TextStyle(
              fontSize: 16.0,
              color: const Color(0xFF0D0E15),
              fontWeight: FontWeight.bold,
            ),
          ),
          new Text(
            task.subTitle,
            style: new TextStyle(
              fontSize: 14.0,
              color: const Color(0xFF0D0E15),
            ),
          ),
        ],
      ),
    );
  }
}
