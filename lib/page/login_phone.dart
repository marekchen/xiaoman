import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xiaoman/networking/api.dart';
import 'package:xiaoman/page/login_phone_view_model.dart';
import 'package:xiaoman/redux/app/app_state.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../base/m_divider.dart';

class LoginPhonePage extends StatelessWidget {
  LoginPhonePage();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginPhoneViewModel>(
      distinct: true,
      converter: (store) => LoginPhoneViewModel.fromStore(store, context),
      builder: (_, viewModel) => LoginPhonePageContent(viewModel),
    );
  }
}

class LoginPhonePageContent extends StatefulWidget {
  LoginPhonePageContent(this.viewModel);

  LoginPhoneViewModel viewModel;

  @override
  LoginPhonePageState createState() => LoginPhonePageState(viewModel);
}

class LoginPhonePageState extends State<LoginPhonePageContent> {
  LoginPhonePageState(this.viewModel);

  final Api api = Api();
  LoginPhoneViewModel viewModel;
  String phoneNum = '13285145373';
  String verifyCode = '111111';

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
            }),
        centerTitle: true,
        title: Text(
          "手机号登录/注册",
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text(
                      "手机号",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      textAlign: TextAlign.start,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(11),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '请输入手机号',
                        hintStyle: TextStyle(
                          color: Color(0xFF768196),
                          fontSize: 18.0,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          this.phoneNum = value;
                        });
                      },
                    ),
                  ),
                  CupertinoButton(
                    child: Text(
                      '获取验证码',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    color: Color(0xFF42BE56),
                    pressedOpacity: 0.2,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    minSize: 30.0,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    onPressed: () {
                      getVerifyCode();
                    },
                  ),
                ],
              ),
            ),
            MDivider(indent: 16.0, color: Color(0xFFF3F4F6)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text(
                      "验证码",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      textAlign: TextAlign.start,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(6),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '请输入验证码',
                        hintStyle: TextStyle(
                          color: Color(0xFF768196),
                          fontSize: 18.0,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          this.verifyCode = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            MDivider(indent: 16.0, color: Color(0xFFF3F4F6)),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CupertinoButton(
                      child: Text('登录/注册'),
                      color: Color(0xFF42BE56),
                      pressedOpacity: 0.2,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 80.0),
                      minSize: 30.0,
                      borderRadius: BorderRadius.all(Radius.circular(22.0)),
                      onPressed: () {
                        login();
                      },
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.0),
            ),
          ],
        ),
      ),
    );
  }

  void getVerifyCode() async {
    String phoneNum = this.phoneNum;
    if (phoneNum.length == 11 && phoneNum.startsWith('1')) {
      var response = await api.getVerifyCode(phoneNum);
      if (response.statusCode != 200) {
        Fluttertoast.showToast(msg: "网络异常或服务器错误");
      } else {
        Map<String, dynamic> responseJson = json.decode(response.body);
        var code = responseJson['code'];
        if (code == 0) {
          // 发送成功
          Fluttertoast.showToast(msg: "发送成功");
        } else {
          // 发送失败
          Fluttertoast.showToast(msg: "发送失败");
        }
      }
    } else {
      Fluttertoast.showToast(msg: "请输入正确的手机号");
    }
  }

  void login() async {
    if (phoneNum != null &&
        phoneNum.length == 11 &&
        phoneNum.startsWith('1') &&
        verifyCode != null &&
        verifyCode.length == 6) {
      viewModel.loginWithVerifyCode(this.phoneNum, this.verifyCode);
    } else {
      Fluttertoast.showToast(msg: "验证码不正确");
    }
  }
}
