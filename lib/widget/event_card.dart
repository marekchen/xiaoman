import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:xiaoman/model/event.dart';
import 'package:xiaoman/page/task.dart';

class EventCard extends StatefulWidget {
  final Event event;

  EventCard({Key key, @required this.event}) : super(key: key);

  @override
  _EventCardState createState() => new _EventCardState();
}

String _getEventActionString(int type) {
  switch (type) {
    case 1:
      return "参加了任务：";
    case 2:
      return "关注了任务：";
    case 3:
      return "发布了手账：";
    default:
      return "不支持的事件类型";
  }
}

String _getBottomLeftString(int type) {
  switch (type) {
    case 1:
    case 2:
      return "关注";
    case 3:
      return "点赞";
    default:
      return "未知";
  }
}

String _getBottomLeftNumString(Event event) {
  var num = 0;
  switch (event.eventType) {
    case 1:
    case 2:
      num = event.followNum;
      break;
    case 3:
      num = event.likeNum;
      break;
    default:
      num = 0;
  }
  num = num != null ? num : 0;
  return num.toString();
}

String _getBottomRightString(int type) {
  switch (type) {
    case 1:
    case 2:
      return "参与";
    case 3:
      return "评论";
    default:
      return "未知";
  }
}

String _getBottomRightNumString(Event event) {
  var num = 0;
  switch (event.eventType) {
    case 1:
    case 2:
      num = event.joinNum;
      break;
    case 3:
      num = event.commentNum;
      break;
    default:
      num = 0;
  }
  num = num != null ? num : 0;
  return num.toString();
}

Widget _buildPictures(List<String> pictures, BuildContext context) {
  if (pictures == null || pictures.length == 0) {
    return new Container();
  }
  if (pictures.length == 1) {
    return new Container(
      margin: const EdgeInsets.only(top: 6.0, bottom: 12.0),
      constraints: new BoxConstraints(
        maxHeight: 200.0,
        minHeight: 100.0,
        minWidth: 100.0,
      ),
      decoration: new BoxDecoration(
        color: Colors.black,
        borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
      ),
      child: new Image.network(
        pictures[0],
        fit: BoxFit.fitHeight,
        alignment: Alignment.topLeft,
      ),
    );
  }
  return new GridView.count(
    shrinkWrap: true,
    primary: false,
    padding: const EdgeInsets.only(top: 6.0, bottom: 12.0),
    crossAxisSpacing: 6.0,
    mainAxisSpacing: 6.0,
    crossAxisCount: 3,
    children: pictures
        .map((String url) => new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                image: new DecorationImage(
                  image: new NetworkImage(url),
                  fit: BoxFit.cover,
                ),
                borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
              ),
            ))
        .toList(),
  );
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
      child: new Container(
        color: Colors.white,
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
                      widget.event.userAvatar,
                      width: 20.0,
                      height: 20.0,
                    ),
                  ),
                  new Text(
                    widget.event.userName,
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
                    _getEventActionString(widget.event.eventType),
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
                widget.event.title,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: new Color(0xFF0D0E15),
                  fontSize: 16.0,
                ),
              ),
            ),
            _buildPictures(widget.event.pictures, context),
            new Padding(
              padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
              child: new InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new TaskHome()),
                  );
                },
                child: new Text(
                  widget.event.body,
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
                    _getBottomLeftNumString(widget.event),
                    style: new TextStyle(
                      color: new Color(0xFF0D0E15),
                      fontSize: 14.0,
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                    child: new Text(
                      _getBottomLeftString(widget.event.eventType),
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
                    _getBottomRightNumString(widget.event),
                    style: new TextStyle(
                      color: new Color(0xFF0D0E15),
                      fontSize: 14.0,
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                    child: new Text(
                      _getBottomRightString(widget.event.eventType),
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
    );
  }
}
