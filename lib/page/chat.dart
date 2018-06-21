import 'package:flutter/material.dart';
import 'package:xiaoman/widget/message_item.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => new _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController _textController = new TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body:new Column(
        children: <Widget>[
          new Flexible(
            child: _buildList(),
          ),
          new Divider(
            height: 1.0,
          ),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _textComposerWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    List<int> messageList;
    return new ListView.builder(
      itemBuilder: (buildContext, index) {
        if(index%2==0) {
          return new MessageItem();
        }else{
          return new MessageItem2();
        }
      },
      itemCount: 20,
    );
  }

  Widget _textComposerWidget() {
    return new IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
                controller: _textController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }
}