import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xiaoman/base/m_divider.dart';

class ChangePhoneNumDialog extends StatefulWidget {
  @override
  ChangePhoneNumDialogState createState() => new ChangePhoneNumDialogState();
}

class ChangePhoneNumDialogState extends State<ChangePhoneNumDialog> {

  String phoneNum;
  String pinCode;

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
          "修改手机号",
          style: new TextStyle(
            fontSize: 18.0,
            color: const Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: new Form(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.symmetric(horizontal: 16.0),
              height: 45.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.only(right: 16.0),
                    child: new Text(
                      "手机号",
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new TextField(
                      autofocus: true,
                      textAlign: TextAlign.start,
                      inputFormatters: <TextInputFormatter>[
                        new LengthLimitingTextInputFormatter(11),
                      ],
                      decoration: new InputDecoration(
                        hintText: '请输入手机号',
                        hintStyle: new TextStyle(
                          color: new Color(0xFF768196),
                          fontSize: 16.0,
                        ),
                        border: InputBorder.none,
                      ),
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          this.phoneNum = value;
                        });
                      },
                    ),
                  ),
                  new CupertinoButton(
                    child: new Text(
                      '获取验证码',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    color: const Color(0xFF42BE56),
                    pressedOpacity: 0.2,
                    padding: new EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    minSize: 30.0,
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(4.0)),
                    onPressed: () {
                      requestPinCode();
                    },
                  ),
                ],
              ),
            ),
            new MDivider(indent: 16.0, color: const Color(0xFFF3F4F6)),
            new Container(
              padding: new EdgeInsets.symmetric(horizontal: 16.0),
              height: 45.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.only(right: 16.0),
                    child: new Text(
                      "验证码",
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new TextField(
                      autofocus: true,
                      textAlign: TextAlign.start,
                      inputFormatters: <TextInputFormatter>[
                        new LengthLimitingTextInputFormatter(6),
                      ],
                      decoration: new InputDecoration(
                        hintText: '请输入验证码',
                        hintStyle: new TextStyle(
                          color: new Color(0xFF768196),
                          fontSize: 16.0,
                        ),
                        border: InputBorder.none,
                      ),
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          this.pinCode = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            new MDivider(indent: 16.0, color: const Color(0xFFF3F4F6)),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new CupertinoButton(
                      child: const Text('确认绑定'),
                      color: const Color(0xFF42BE56),
                      pressedOpacity: 0.2,
                      padding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 80.0),
                      minSize: 30.0,
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(4.0)),
                      onPressed: () {
                        bindPhoneNum();
                      },
                    ),
                  ),
                ],
              ),
              padding: new EdgeInsets.all(16.0),
            ),
          ],
        ),
      ),
    );
  }

  void requestPinCode() {
    String phoneNum =  this.phoneNum;
    String userId;
  }

  void bindPhoneNum(){
    String phoneNum =  this.phoneNum;
    String pinCode = this.pinCode;
    String userId;
  }
}
