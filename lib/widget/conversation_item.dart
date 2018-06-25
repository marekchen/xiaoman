import 'package:flutter/material.dart';

import '../page/chat.dart';

class ConversationItem extends StatelessWidget {
  ConversationItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 16.0, top: 0.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                      fit: BoxFit.fitHeight,
                      //alignment: Alignment.topLeft,
                    ),
                  ),
                  width: 50.0,
                  height: 50.0,
                  margin: EdgeInsets.only(right: 16.0),
                ),
                Expanded(
                  child: Container(
                    height: 50.0,
                    margin: EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "系统消息",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFF0D0E15),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "5月18日",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xFFACACAC)),
                            ),
                          ],
                        ),
                        Text(
                          "没有新的消息",
                          style: TextStyle(
                              fontSize: 14.0, color: Color(0xFFACACAC)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 26.0,
              indent: 66.0,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
      },
    );
  }
}
