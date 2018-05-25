import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:xiaoman/model/article.dart';

class ArticleCard extends StatefulWidget {
  final Article article;

  ArticleCard({Key key, @required this.article}) : super(key: key);

  @override
  _ArticleCardState createState() => new _ArticleCardState();
}

Widget _buildPictures(List<String> pictures, BuildContext context) {
  if (pictures == null || pictures.length == 0) {
    return new Container();
  }
  if (pictures.length == 1) {
    return new Container(
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      constraints: new BoxConstraints(
        maxHeight: 200.0,
        minHeight: 100.0,
        minWidth: 100.0,
      ),
      child: new ClipRRect(
        borderRadius: new BorderRadius.circular(4.0),
        child: new Image.network(
          pictures[0],
          fit: BoxFit.fitHeight,
          //alignment: Alignment.topLeft,
        ),
      ),
    );
  }
  return new GridView.count(
    shrinkWrap: true,
    primary: false,
    padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
    crossAxisSpacing: 6.0,
    mainAxisSpacing: 6.0,
    crossAxisCount: 3,
    physics: new NeverScrollableScrollPhysics(),
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

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      padding: new EdgeInsets.fromLTRB(16.0, 17.0, 16.0, 12.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new Container(
                  height: 32.0,
                  width: 32.0,
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(4.0),
                    child: new Image.network(
                      widget.article.userAvatar,
                      fit: BoxFit.cover,
                      //alignment: Alignment.topLeft,
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(left: 11.0),
                  child: new Text(
                    widget.article.userName,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: new Color(0xFF0D0E15),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(43.0, 0.0, 0.0, 8.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  widget.article.content,
                  style: new TextStyle(
                    color: new Color(0xFF0D0E15),
                    fontSize: 16.0,
                  ),
                ),
                _buildPictures(widget.article.pictures, context),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "20分钟前",
                      style: new TextStyle(
                        color: new Color(0xFF9DA4B3),
                        fontSize: 14.0,
                      ),
                    ),
                    new Row(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Padding(
                              padding: new EdgeInsets.only(left: 2.0),
                              child: new Icon(
                                Icons.star_border,
                                size: 14.0,
                                color: const Color(0xFF0D0E15),
                              ),
                            ),
                            new Text(
                              "赞",
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: const Color(0xFF768196),
                              ),
                            ),
                          ],
                        ),
                        new Row(
                          children: <Widget>[
                            new Padding(
                              padding: new EdgeInsets.only(left: 10.0),
                              child: new Icon(
                                Icons.insert_comment,
                                size: 14.0,
                                color: const Color(0xFF0D0E15),
                              ),
                            ),
                            new Text(
                              "评论",
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: const Color(0xFF768196),
                              ),
                            ),
                          ],
                        ),
                        new PopupMenuButton<String>(
                          padding: new EdgeInsets.only(left: 8.0, right: 8.0),
                          icon: new Icon(
                            Icons.clear_all,
                            size: 14.0,
                            color: const Color(0xFF0D0E15),
                          ),
                          //onSelected: showMenuSelection,
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<String>>[
                                const PopupMenuItem<String>(
                                    value: 'id1', child: const Text('action1')),
                                const PopupMenuItem<String>(
                                    value: 'id2', child: const Text('action2')),
                                const PopupMenuItem<String>(
                                    value: 'id3', child: const Text('action3')),
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
          new Divider(height: 0.0, color: new Color(0xFFEFF0F2)),
        ],
      ),
    );
  }
}

Widget _buildCommentList(List<Comment> commentList, BuildContext context) {
  return new Container();
}
