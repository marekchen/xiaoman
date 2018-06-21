import 'package:flutter/material.dart';
import 'package:xiaoman/base/mcard.dart';
import 'package:xiaoman/widget/chat_card.dart';

class MessageItem extends StatelessWidget {
  MessageItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(16.0),
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
                width: 32.0,
                height: 32.0,
                margin: new EdgeInsets.only(right: 10.0),
              ),
              new Flexible(
                child: new ChatCard(
                  child: new Text(
                    "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述",
                    style: new TextStyle(
                        color: const Color(0xFF000000), fontSize: 15.0),
                    softWrap: true,
                  ),
                  color:  Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(2.0),
                      topRight: new Radius.circular(6.0),
                      bottomLeft: new Radius.circular(6.0),
                      bottomRight: new Radius.circular(6.0)),
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
    return new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Flexible(
                child: new ChatCard(
                  child: new Text(
                    "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述",
                    style: new TextStyle(
                        color: const Color(0xFFFFFFFF), fontSize: 15.0),
                    softWrap: true,
                  ),
                  color: const Color(0xFF66CB89),
                  borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(6.0),
                      topRight: new Radius.circular(2.0),
                      bottomLeft: new Radius.circular(6.0),
                      bottomRight: new Radius.circular(6.0)),
                ),
              ),
              new Container(
                child: new ClipRRect(
                  borderRadius: new BorderRadius.circular(4.0),
                  child: new Image.network(
                    "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                    fit: BoxFit.fitHeight,
                    //alignment: Alignment.topLeft,
                  ),
                ),
                width: 32.0,
                height: 32.0,
                margin: new EdgeInsets.only(left: 10.0),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}