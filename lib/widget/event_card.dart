import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../model/event.dart';
import '../page/task.dart';

class EventCard extends StatefulWidget {
  final Event event;

  EventCard({Key key, @required this.event}) : super(key: key);

  @override
  _EventCardState createState() => _EventCardState();
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
    return Container();
  }
  if (pictures.length == 1) {
    return Container(
      margin: EdgeInsets.only(top: 6.0, bottom: 12.0),
      constraints: BoxConstraints(
        maxHeight: 200.0,
        minHeight: 100.0,
        minWidth: 100.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.network(
          pictures[0],
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
  return GridView.count(
    shrinkWrap: true,
    primary: false,
    padding: EdgeInsets.only(top: 6.0, bottom: 12.0),
    crossAxisSpacing: 6.0,
    mainAxisSpacing: 6.0,
    crossAxisCount: 3,
    physics: NeverScrollableScrollPhysics(),
    children: pictures
        .map((String url) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ))
        .toList(),
  );
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16.0, 17.0, 16.0, 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 6.0, 0.0),
                    child: Image.network(
                      widget.event.userAvatar,
                      width: 20.0,
                      height: 20.0,
                    ),
                  ),
                  Text(
                    widget.event.userName,
                    style: TextStyle(
                      color: Color(0xff768196),
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    " · ",
                    style: TextStyle(
                      color: Color(0xff768196),
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    _getEventActionString(widget.event.eventType),
                    style: TextStyle(
                      color: Color(0xff768196),
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ),
            Divider(height: 0.0, color: Color(0xFFEFF0F2)),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 8.0),
              child: Text(
                widget.event.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D0E15),
                  fontSize: 16.0,
                ),
              ),
            ),
            _buildPictures(widget.event.pictures, context),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskHome()),
                  );
                },
                child: Text(
                  widget.event.body,
                  style: TextStyle(
                    color: Color(0xFF0D0E15),
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            Divider(height: 0.0, color: Color(0xFFEFF0F2)),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    _getBottomLeftNumString(widget.event),
                    style: TextStyle(
                      color: Color(0xFF0D0E15),
                      fontSize: 14.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                    child: Text(
                      _getBottomLeftString(widget.event.eventType),
                      style: TextStyle(
                        color: Color(0xFF768196),
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      "·",
                      style: TextStyle(
                        color: Color(0xFF768196),
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Text(
                    _getBottomRightNumString(widget.event),
                    style: TextStyle(
                      color: Color(0xFF0D0E15),
                      fontSize: 14.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                    child: Text(
                      _getBottomRightString(widget.event.eventType),
                      style: TextStyle(
                        color: Color(0xFF768196),
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
