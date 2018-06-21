import 'package:flutter/material.dart';
import 'package:xiaoman/widget/conversation_item.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => new _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: _buildList(),
    );
  }
}

Widget _buildList() {
  List<int> messageList;
  return new ListView.builder(
    itemBuilder: (buildContext, index) {
      return new ConversationItem();
    },
    itemCount: 20,
  );
}
