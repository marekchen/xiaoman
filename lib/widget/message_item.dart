import 'package:flutter/material.dart';

import '../widget/chat_card.dart';

class MessageItem extends StatelessWidget {
  MessageItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
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
                width: 32.0,
                height: 32.0,
                margin: EdgeInsets.only(right: 10.0),
              ),
              Flexible(
                child: ChatCard(
                  child: Text(
                    "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述",
                    style: TextStyle(
                        color: Color(0xFF000000), fontSize: 15.0),
                    softWrap: true,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.0),
                      topRight: Radius.circular(6.0),
                      bottomLeft: Radius.circular(6.0),
                      bottomRight: Radius.circular(6.0)),
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}

class MessageItem2 extends StatelessWidget {
  MessageItem2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: ChatCard(
                  child: Text(
                    "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF), fontSize: 15.0),
                    softWrap: true,
                  ),
                  color: Color(0xFF66CB89),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6.0),
                      topRight: Radius.circular(2.0),
                      bottomLeft: Radius.circular(6.0),
                      bottomRight: Radius.circular(6.0)),
                ),
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(
                    "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                    fit: BoxFit.fitHeight,
                    //alignment: Alignment.topLeft,
                  ),
                ),
                width: 32.0,
                height: 32.0,
                margin: EdgeInsets.only(left: 10.0),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}
