import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("1111"),
      ),
      body: new Center(
        child: new Image.network(
          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
          width: 375.0,
          height: 375.0,
        ),
      ),
    );
  }
}
