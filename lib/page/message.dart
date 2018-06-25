import 'package:flutter/material.dart';

import '../widget/conversation_item.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildList(),
    );
  }
}

Widget _buildList() {
  List<int> messageList;
  return ListView.builder(
    itemBuilder: (buildContext, index) {
      return ConversationItem();
    },
    itemCount: 20,
  );
}
