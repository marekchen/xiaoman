import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../base/m_divider.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({Key key}) : super(key: key);

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
          "个人信息",
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(height: 0.0, color: Color(0xFFF3F4F6)),
        InkWell(
          child: Container(
            height: 100.0,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "头像",
                  style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                        "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFFACACAC),
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 162.0,
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          height: 54.0,
                          child: Center(
                            child: Text(
                              "相册",
                              style: TextStyle(
                                  color: Color(0xFF333333), fontSize: 18.0),
                            ),
                          ),
                        ),
                        onTap: () {
                          ImagePicker
                              .pickImage(source: ImageSource.gallery)
                              .then((file) {});
                        },
                      ),
                      Divider(
                        height: 0.0,
                        color: Color(0xFFF3F4F6),
                      ),
                      InkWell(
                        child: Container(
                          height: 54.0,
                          child: Center(
                            child: Text(
                              "拍照",
                              style: TextStyle(
                                  color: Color(0xFF333333), fontSize: 18.0),
                            ),
                          ),
                        ),
                        onTap: () {
                          ImagePicker
                              .pickImage(source: ImageSource.camera)
                              .then((file) {});
                        },
                      ),
                      Divider(
                        height: 0.0,
                        color: Color(0xFFF3F4F6),
                      ),
                      InkWell(
                        child: Container(
                          height: 54.0,
                          child: Center(
                            child: Text(
                              "取消",
                              style: TextStyle(
                                  color: Color(0xFF333333), fontSize: 18.0),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: Color(0xFFF3F4F6),
        ),
        InkWell(
          child: Container(
            height: 54.0,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "昵称",
                  style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "噼里啪啦酱",
                      style: TextStyle(
                        color: Color(0xFFACACAC),
                        fontSize: 15.0,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFFACACAC),
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () {},
        ),
        MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: Color(0xFFF3F4F6),
        ),
        InkWell(
          child: Container(
            height: 54.0,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "性别",
                  style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "男",
                      style: TextStyle(
                        color: Color(0xFFACACAC),
                        fontSize: 15.0,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFFACACAC),
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 162.0,
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          height: 54.0,
                          child: Center(
                            child: Text(
                              "男",
                              style: TextStyle(
                                  color: Color(0xFF333333), fontSize: 18.0),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      Divider(
                        height: 0.0,
                        color: Color(0xFFF3F4F6),
                      ),
                      InkWell(
                        child: Container(
                          height: 54.0,
                          child: Center(
                            child: Text(
                              "女",
                              style: TextStyle(
                                  color: Color(0xFF333333), fontSize: 18.0),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      Divider(
                        height: 0.0,
                        color: Color(0xFFF3F4F6),
                      ),
                      InkWell(
                        child: Container(
                          height: 54.0,
                          child: Center(
                            child: Text(
                              "取消",
                              style: TextStyle(
                                  color: Color(0xFF333333), fontSize: 18.0),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: Color(0xFFF3F4F6),
        ),
        InkWell(
          child: Container(
            height: 54.0,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "地区",
                  style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "上海",
                      style: TextStyle(
                        color: Color(0xFFACACAC),
                        fontSize: 15.0,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFFACACAC),
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () {},
        ),
        MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: Color(0xFFF3F4F6),
        ),
        InkWell(
          child: Container(
            height: 54.0,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "个人简介",
                  style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "几番离别，几番告白",
                      style: TextStyle(
                        color: Color(0xFFACACAC),
                        fontSize: 15.0,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFFACACAC),
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () {},
        ),
        MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: Color(0xFFF3F4F6),
        ),
      ],
    );
  }
}
