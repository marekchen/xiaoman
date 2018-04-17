import 'package:flutter/material.dart';
import 'package:xiaoman/base/mcard.dart';
import 'package:xiaoman/task.dart';

class EventCard extends StatefulWidget {
  EventCard({Key key}) : super(key: key);

  @override
  _EventCardState createState() => new _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
      child: new MCard(
        color: new Color(0xFFFFFFFF),
        child: new Container(
          padding: new EdgeInsets.fromLTRB(16.0, 17.0, 16.0, 12.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 6.0, 0.0),
                      child: new Image.network(
                        "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    new Text(
                      "霹雳巴拉酱",
                      style: new TextStyle(
                        color: new Color(0xff768196),
                        fontSize: 14.0,
                      ),
                    ),
                    new Text(
                      " · ",
                      style: new TextStyle(
                        color: new Color(0xff768196),
                        fontSize: 14.0,
                      ),
                    ),
                    new Text(
                      "参加了任务：",
                      style: new TextStyle(
                        color: new Color(0xff768196),
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              ),
              new Divider(height: 0.0, color: new Color(0xFFEFF0F2)),
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 8.0),
                child: new Text(
                  "我是任务标题，是啥任务咧，点我瞧瞧",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    color: new Color(0xFF0D0E15),
                    fontSize: 16.0,
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new TaskHome()),
                    );
                  },
                  child: new Text(
                    "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧",
                    style: new TextStyle(
                      color: new Color(0xFF0D0E15),
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              new Divider(height: 0.0, color: new Color(0xFFEFF0F2)),
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 0.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Text(
                      "300",
                      style: new TextStyle(
                        color: new Color(0xFF0D0E15),
                        fontSize: 14.0,
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                      child: new Text(
                        "关注",
                        style: new TextStyle(
                          color: new Color(0xFF768196),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: new Text(
                        "·",
                        style: new TextStyle(
                          color: new Color(0xFF768196),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    new Text(
                      "143",
                      style: new TextStyle(
                        color: new Color(0xFF0D0E15),
                        fontSize: 14.0,
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                      child: new Text(
                        "参与",
                        style: new TextStyle(
                          color: new Color(0xFF768196),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}