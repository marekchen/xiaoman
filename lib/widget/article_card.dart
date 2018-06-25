import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../model/article.dart';

class ArticleCard extends StatefulWidget {
  final Article article;

  ArticleCard({Key key, @required this.article}) : super(key: key);

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

Widget _buildPictures(List<String> pictures, BuildContext context) {
  if (pictures == null || pictures.length == 0) {
    return Container();
  }
  if (pictures.length == 1) {
    return Container(
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
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
          //alignment: Alignment.topLeft,
        ),
      ),
    );
  }
  return GridView.count(
    shrinkWrap: true,
    primary: false,
    padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
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

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.0, 17.0, 16.0, 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 32.0,
                  width: 32.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      widget.article.userAvatar,
                      fit: BoxFit.cover,
                      //alignment: Alignment.topLeft,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Text(
                    widget.article.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D0E15),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(43.0, 0.0, 0.0, 8.0),
            child: Column(
              children: <Widget>[
                Text(
                  widget.article.content,
                  style: TextStyle(
                    color: Color(0xFF0D0E15),
                    fontSize: 16.0,
                  ),
                ),
                _buildPictures(widget.article.pictures, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "20分钟前",
                      style: TextStyle(
                        color: Color(0xFF9DA4B3),
                        fontSize: 14.0,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 2.0),
                              child: Icon(
                                Icons.star_border,
                                size: 14.0,
                                color: Color(0xFF0D0E15),
                              ),
                            ),
                            Text(
                              "赞",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFF768196),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.insert_comment,
                                size: 14.0,
                                color: Color(0xFF0D0E15),
                              ),
                            ),
                            Text(
                              "评论",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFF768196),
                              ),
                            ),
                          ],
                        ),
                        PopupMenuButton<String>(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          icon: Icon(
                            Icons.clear_all,
                            size: 14.0,
                            color: Color(0xFF0D0E15),
                          ),
                          //onSelected: showMenuSelection,
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<String>>[
                                PopupMenuItem<String>(
                                    value: 'id1', child: Text('action1')),
                                PopupMenuItem<String>(
                                    value: 'id2', child: Text('action2')),
                                PopupMenuItem<String>(
                                    value: 'id3', child: Text('action3')),
                              ],
                        ),
                      ],
                    )
                  ],
                ),
                _buildCommentList(widget.article.commentList, context),
              ],
            ),
          ),
          Divider(height: 0.0, color: Color(0xFFEFF0F2)),
        ],
      ),
    );
  }
}

Widget _buildCommentList(List<Comment> commentList, BuildContext context) {
  return Container();
}
