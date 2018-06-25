import 'package:flutter/material.dart';

class SwitchRole extends StatefulWidget {
  SwitchRole({Key key}) : super(key: key);

  @override
  _SwitchRoleState createState() => _SwitchRoleState();
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF0D0E15),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "切换身份",
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF8F9FA),
      body: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "噼里啪啦酱",
                          style: TextStyle(
                            color: Color(0xFF0D0E15),
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "我是一个快乐的人儿",
                          style: TextStyle(
                            color: Color(0xFFACACAC),
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Radio<int>(
                    value: 0,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
              ],
            ),
          ),
          Divider(height: 0.0, indent: 92.0, color: Color(0xFFF3F4F6)),
          Container(
            height: 100.0,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "噼里啪啦酱",
                          style: TextStyle(
                            color: Color(0xFF0D0E15),
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "我是一个快乐的人儿",
                          style: TextStyle(
                            color: Color(0xFFACACAC),
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Radio<int>(
                    value: 1,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
              ],
            ),
          ),
          Divider(height: 0.0, indent: 92.0, color: Color(0xFFF3F4F6)),
          Container(
            height: 100.0,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "噼里啪啦酱",
                          style: TextStyle(
                            color: Color(0xFF0D0E15),
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "我是一个快乐的人儿",
                          style: TextStyle(
                            color: Color(0xFFACACAC),
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Radio<int>(
                  value: 2,
                  groupValue: radioValue,
                  onChanged: handleRadioValueChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
