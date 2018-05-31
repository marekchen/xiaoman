import 'package:flutter/material.dart';

class SwitchRole extends StatefulWidget {
  SwitchRole({Key key}) : super(key: key);

  @override
  _SwitchRoleState createState() => new _SwitchRoleState();
}

class _SwitchRoleState extends State<SwitchRole> {
  int radioValue = 0;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: const Color(0xFF0D0E15),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: new Text(
          "切换身份",
          style: new TextStyle(
            fontSize: 18.0,
            color: const Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: new Column(
        children: <Widget>[
          new Container(
            height: 100.0,
            color: Colors.white,
            padding: new EdgeInsets.symmetric(horizontal: 16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(right: 16.0),
                      child: new CircleAvatar(
                        radius: 30.0,
                        backgroundImage: new NetworkImage(
                          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                        ),
                      ),
                    ),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          "噼里啪啦酱",
                          style: new TextStyle(
                            color: const Color(0xFF0D0E15),
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "我是一个快乐的人儿",
                          style: new TextStyle(
                            color: const Color(0xFFACACAC),
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                new Radio<int>(
                    value: 0,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
              ],
            ),
          ),
          new Divider(
              height: 0.0, indent: 92.0, color: const Color(0xFFF3F4F6)),
          new Container(
            height: 100.0,
            color: Colors.white,
            padding: new EdgeInsets.symmetric(horizontal: 16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(right: 16.0),
                      child: new CircleAvatar(
                        radius: 30.0,
                        backgroundImage: new NetworkImage(
                          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                        ),
                      ),
                    ),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          "噼里啪啦酱",
                          style: new TextStyle(
                            color: const Color(0xFF0D0E15),
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "我是一个快乐的人儿",
                          style: new TextStyle(
                            color: const Color(0xFFACACAC),
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                new Radio<int>(
                    value: 1,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
              ],
            ),
          ),
          new Divider(
              height: 0.0, indent: 92.0, color: const Color(0xFFF3F4F6)),
          new Container(
            height: 100.0,
            color: Colors.white,
            padding: new EdgeInsets.symmetric(horizontal: 16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(right: 16.0),
                      child: new CircleAvatar(
                        radius: 30.0,
                        backgroundImage: new NetworkImage(
                          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                        ),
                      ),
                    ),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          "噼里啪啦酱",
                          style: new TextStyle(
                            color: const Color(0xFF0D0E15),
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "我是一个快乐的人儿",
                          style: new TextStyle(
                            color: const Color(0xFFACACAC),
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                new Radio<int>(
                    value: 2,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
