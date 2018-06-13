import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xiaoman/plugin/rongcloud.dart';
import 'package:image_picker/image_picker.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => new _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
  }

//  StreamSubscription<Response> _messageCallbackSubscription;
  String text = "11";
  String text2 = "22";
  String text3 = "33";
  String text4 = "44";

  setText(t) {
    setState(() {
      text = t;
    });
  }

  @override
  void dispose() {
//    _messageCallbackSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Column(
          children: <Widget>[
            new Text("1111111111111"),
            new Text("2222222222222"),
            new RaisedButton(
              onPressed: () {
                RongCloud.connect(
                    "GajZWPd5yIqDpMZIXobBOGpomLY2zaivtK7TeS41XfJnGS22i5plmh3cOT59KFgBiMoQSCw9PYFaC/Db56F6oSCfqWPCQZ0R");
              },
              child: new Text("connect"),
            ),
            new Text(text),
            new Text(text2),
            new RaisedButton(
              onPressed: () {
                TextMessage content = new TextMessage("test Text Message");
                Message message =
                    new Message("chenpei2", ConversationType.PRIVATE, content);
                RongCloud.sendMessage(message).listen((Response response) {
                  setState(() {
                    if (response.code == 0) {
                      print(response.result.toMap());
                      text2 = response.result.toMap().toString();
                    } else {
                      print(response.result.toString());
                      text2 = response.result.toString();
                    }
                  });
                });
              },
              child: new Text("sendMessage"),
            ),
            new Text(text3),
            new RaisedButton(
              onPressed: () {
                ImagePicker.pickImage(source: ImageSource.gallery).then((file) {
                  ImageMessage content = new ImageMessage(
                      thumbUri: file.uri, localUri: file.uri, isFull: false);
                  Message message = new Message(
                      "chenpei2", ConversationType.PRIVATE, content);
                  RongCloud
                      .sendImageMessage(message)
                      .listen((Response response) {
                    setState(() {
                      if (response.code == 0) {
                        print(response.result.toMap());
                        text3 = response.result.toMap().toString();
                      } else {
                        print(response.result.toString());
                        text3 = response.result.toString();
                      }
                    });
                  });
                });
              },
              child: new Text("pick-image"),
            ),
            new Text(text4),
            new RaisedButton(
              onPressed: () {
                ImagePicker.pickImage(source: ImageSource.gallery).then((file) {
                  FileMessage content = new FileMessage(file.uri);
                  Message message = new Message(
                      "chenpei2", ConversationType.PRIVATE, content);
                  RongCloud
                      .sendMediaMessage(message)
                      .listen((Response response) {
                    setState(() {
                      if (response.code == 0) {
                        print(response.result.toMap());
                        text4 = response.result.toMap().toString();
                      } else {
                        print(response.result.toString());
                        text4 = response.result.toString();
                      }
                    });
                  });
                });
              },
              child: new Text("pick-file"),
            ),
            new RaisedButton(
              onPressed: () {
                RongCloud
                    .clearMessagesUnreadStatus(
                        "chenpei", ConversationType.PRIVATE)
                    .then((response) {});
              },
              child: new Text("clearMessagesUnreadStatus"),
            ),
          ],
        ));
  }
}
