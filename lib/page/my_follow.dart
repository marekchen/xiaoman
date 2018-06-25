import 'package:flutter/material.dart';

import '../base/m_underline_tab_indicator.dart';
import '../model/task.dart';

class MyFollow extends StatefulWidget {
  MyFollow({Key key}) : super(key: key);

  @override
  _MyFollowState createState() => _MyFollowState();
}

class _MyFollowState extends State<MyFollow> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFFE9ECEF)),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "我的关注",
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xFF0D0E15),
              ),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 1.0,
            bottom: TabBar(
              indicator: MUnderlineTabIndicator(
                insets: EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 0.0),
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
                        "用户",
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
                        "任务",
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
          body: TabBarView(
            children: [
              ListView.builder(
                key: PageStorageKey<String>("follow-user"),
                itemBuilder: (BuildContext context, int index) =>
                    UserInfoCard(list[index]),
                itemCount: list.length,
              ),
              ListView.builder(
                key: PageStorageKey<String>("follow-task"),
                itemBuilder: (BuildContext context, int index) =>
                    TaskCard(taskList[index]),
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
  UserInfo({this.name, this.avatar});

  final String name;
  final String avatar;
}

List<Task> taskList = <Task>[
  Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧",
  ),
  Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
  Task(
    title: "我是任务标题，是啥任务咧，点我瞧瞧",
    subTitle: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我",
  ),
];

List<UserInfo> list = <UserInfo>[
  UserInfo(
      name: "毛莎莎",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "吴亦凡",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "王火种",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
  UserInfo(
      name: "陈小春",
      avatar:
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg"),
];

class UserInfoCard extends StatelessWidget {
  UserInfoCard(this.userInfo);

  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61.0,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 32.0,
                      width: 32.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          userInfo.avatar,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        userInfo.name,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF0D0E15),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "已关注",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF768196),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1.0, color: Color(0xFFF3F4F6))
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  TaskCard(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      margin: EdgeInsets.only(bottom: 1.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            task.title,
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF0D0E15),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            task.subTitle,
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF0D0E15),
            ),
          ),
        ],
      ),
    );
  }
}
