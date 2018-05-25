import 'package:flutter/material.dart';
import 'package:xiaoman/base/mcard.dart';
import 'package:xiaoman/model/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;

  CommentCard({Key key, @required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new Row(
        children: <Widget>[
          new Container(
            height: 32.0,
            width: 32.0,
            child: new ClipRRect(
              borderRadius: new BorderRadius.circular(4.0),
              child: new Image.network(
                comment.userAvatar,
                fit: BoxFit.cover,
                //alignment: Alignment.topLeft,
              ),
            ),
          ),
          new Expanded(
            child: new Container(
              padding: new EdgeInsets.only(left: 11.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 7.0),
                    child: new Text(
                      comment.userName,
                      style: new TextStyle(
                        color: const Color(0xFF9DA4B3),
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new MCard(
                    color: Colors.white,
                    radius: 6.0,
                    child: new Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      margin: const EdgeInsets.only(top: 7.0, bottom: 10.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            comment.content,
                            style: new TextStyle(
                              color: const Color(0xFF0D0E15),
                              fontSize: 16.0,
                            ),
                          ),
                          const Divider(
                              height: 20.0, color: const Color(0xFFE9ECEF)),
                          new Row(
                            children: <Widget>[
                              new Icon(
                                Icons.star_border,
                                color: const Color(0xFF768196),
                              ),
                              new Text(
                                comment.likeNum.toString() + "个赞",
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: const Color(0xFF768196),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          comment.replyNum.toString() + "条回复 >",
                          style: new TextStyle(
                              fontSize: 12.0, color: const Color(0xFF0085FF)),
                        ),
                        new Text(
                          '60分钟前',
                          style: new TextStyle(
                              fontSize: 12.0,
                              color: const Color(0xFF9DA4B3),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
