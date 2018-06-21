import 'package:flutter/material.dart';
import 'package:xiaoman/page/chat.dart';

class ConversationItem extends StatelessWidget {
  ConversationItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new Container(
        padding: const EdgeInsets.only(left: 16.0, top: 0.0),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(4.0),
                    child: new Image.network(
                      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                      fit: BoxFit.fitHeight,
                      //alignment: Alignment.topLeft,
                    ),
                  ),
                  width: 50.0,
                  height: 50.0,
                  margin: new EdgeInsets.only(right: 16.0),
                ),
                new Expanded(
                  child: new Container(
                    height: 50.0,
                    margin: new EdgeInsets.only(right: 16.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(
                              "系统消息",
                              style: new TextStyle(
                                  fontSize: 16.0,
                                  color: const Color(0xFF0D0E15),
                                  fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              "5月18日",
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  color: const Color(0xFFACACAC)),
                            ),
                          ],
                        ),
                        new Text(
                          "没有新的消息",
                          style: new TextStyle(
                              fontSize: 14.0, color: const Color(0xFFACACAC)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            new Divider(
              height: 26.0,
              indent: 66.0,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new ChatPage()),
        );
      },
    );
  }
}
