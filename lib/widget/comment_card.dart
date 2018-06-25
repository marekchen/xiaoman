import 'package:flutter/material.dart';

import '../base/mcard.dart';
import '../model/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;

  CommentCard({Key key, @required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 32.0,
            width: 32.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                comment.userAvatar,
                fit: BoxFit.cover,
                //alignment: Alignment.topLeft,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 11.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 7.0),
                    child: Text(
                      comment.userName,
                      style: TextStyle(
                        color: Color(0xFF9DA4B3),
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MCard(
                    color: Colors.white,
                    radius: 6.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      margin: EdgeInsets.only(top: 7.0, bottom: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            comment.content,
                            style: TextStyle(
                              color: Color(0xFF0D0E15),
                              fontSize: 16.0,
                            ),
                          ),
                          Divider(
                              height: 20.0, color: Color(0xFFE9ECEF)),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star_border,
                                color: Color(0xFF768196),
                              ),
                              Text(
                                comment.likeNum.toString() + "个赞",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xFF768196),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          comment.replyNum.toString() + "条回复 >",
                          style: TextStyle(
                              fontSize: 12.0, color: Color(0xFF0085FF)),
                        ),
                        Text(
                          '60分钟前',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFF9DA4B3),
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
