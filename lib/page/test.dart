import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../plugin/rongcloud.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
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
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Text("1111111111111"),
            Text("2222222222222"),
            RaisedButton(
              onPressed: () {
                RongCloud.connect(
                    "GajZWPd5yIqDpMZIXobBOGpomLY2zaivtK7TeS41XfJnGS22i5plmh3cOT59KFgBiMoQSCw9PYFaC/Db56F6oSCfqWPCQZ0R");
              },
              child: Text("connect"),
            ),
            Text(text),
            Text(text2),
            RaisedButton(
              onPressed: () {
                TextMessage content = TextMessage("test Text Message");
                Message message =
                    Message("chenpei2", ConversationType.PRIVATE, content);
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
              child: Text("sendMessage"),
            ),
            Text(text3),
            RaisedButton(
              onPressed: () {
                ImagePicker.pickImage(source: ImageSource.gallery).then((file) {
                  ImageMessage content = ImageMessage(
                      thumbUri: file.uri, localUri: file.uri, isFull: false);
                  Message message =
                      Message("chenpei2", ConversationType.PRIVATE, content);
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
              child: Text("pick-image"),
            ),
            Text(text4),
            RaisedButton(
              onPressed: () {
                ImagePicker.pickImage(source: ImageSource.gallery).then((file) {
                  FileMessage content = FileMessage(file.uri);
                  Message message =
                      Message("chenpei2", ConversationType.PRIVATE, content);
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
              child: Text("pick-file"),
            ),
            RaisedButton(
              onPressed: () {
                RongCloud
                    .clearMessagesUnreadStatus(
                        "chenpei", ConversationType.PRIVATE)
                    .then((response) {});
              },
              child: Text("clearMessagesUnreadStatus"),
            ),
          ],
        ));
  }
}
