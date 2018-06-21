import 'package:flutter/material.dart';
import 'package:xiaoman/base/m_divider.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({Key key}) : super(key: key);

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
          "个人信息",
          style: new TextStyle(
            fontSize: 18.0,
            color: const Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: new Body(),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => new _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
        new InkWell(
          child: new Container(
            height: 100.0,
            padding: new EdgeInsets.all(16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "头像",
                  style: new TextStyle(
                      color: const Color(0xFF333333), fontSize: 16.0),
                ),
                new Row(
                  children: <Widget>[
                    new CircleAvatar(
                      radius: 30.0,
                      backgroundImage: new NetworkImage(
                        "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                      ),
                    ),
                    new Icon(
                      Icons.keyboard_arrow_right,
                      color: const Color(0xFFACACAC),
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
                return new Container(
                  height: 162.0,
                  child: new Column(
                    children: <Widget>[
                      new InkWell(
                        child: new Container(
                          height: 54.0,
                          child: new Center(
                            child: new Text(
                              "相册",
                              style: new TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 18.0),
                            ),
                          ),
                        ),
                        onTap: () {
                          ImagePicker
                              .pickImage(source: ImageSource.gallery)
                              .then((file) {});
                        },
                      ),
                      new Divider(
                        height: 0.0,
                        color: const Color(0xFFF3F4F6),
                      ),
                      new InkWell(
                        child: new Container(
                          height: 54.0,
                          child: new Center(
                            child: new Text(
                              "拍照",
                              style: new TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 18.0),
                            ),
                          ),
                        ),
                        onTap: () {
                          ImagePicker
                              .pickImage(source: ImageSource.camera)
                              .then((file) {});
                        },
                      ),
                      new Divider(
                        height: 0.0,
                        color: const Color(0xFFF3F4F6),
                      ),
                      new InkWell(
                        child: new Container(
                          height: 54.0,
                          child: new Center(
                            child: new Text(
                              "取消",
                              style: new TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 18.0),
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
        new MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: const Color(0xFFF3F4F6),
        ),
        new InkWell(
          child: new Container(
            height: 54.0,
            padding: new EdgeInsets.all(16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "昵称",
                  style: new TextStyle(
                      color: const Color(0xFF333333), fontSize: 16.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      "噼里啪啦酱",
                      style: new TextStyle(
                        color: const Color(0xFFACACAC),
                        fontSize: 15.0,
                      ),
                    ),
                    new Icon(
                      Icons.keyboard_arrow_right,
                      color: const Color(0xFFACACAC),
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () {},
        ),
        new MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: const Color(0xFFF3F4F6),
        ),
        new InkWell(
          child: new Container(
            height: 54.0,
            padding: new EdgeInsets.all(16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "性别",
                  style: new TextStyle(
                      color: const Color(0xFF333333), fontSize: 16.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      "男",
                      style: new TextStyle(
                        color: const Color(0xFFACACAC),
                        fontSize: 15.0,
                      ),
                    ),
                    new Icon(
                      Icons.keyboard_arrow_right,
                      color: const Color(0xFFACACAC),
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
                return new Container(
                  height: 162.0,
                  child: new Column(
                    children: <Widget>[
                      new InkWell(
                        child: new Container(
                          height: 54.0,
                          child: new Center(
                            child: new Text(
                              "男",
                              style: new TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 18.0),
                            ),
                          ),
                        ),
                        onTap: () {
                        },
                      ),
                      new Divider(
                        height: 0.0,
                        color: const Color(0xFFF3F4F6),
                      ),
                      new InkWell(
                        child: new Container(
                          height: 54.0,
                          child: new Center(
                            child: new Text(
                              "女",
                              style: new TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 18.0),
                            ),
                          ),
                        ),
                        onTap: () {
                        },
                      ),
                      new Divider(
                        height: 0.0,
                        color: const Color(0xFFF3F4F6),
                      ),
                      new InkWell(
                        child: new Container(
                          height: 54.0,
                          child: new Center(
                            child: new Text(
                              "取消",
                              style: new TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 18.0),
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
        new MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: const Color(0xFFF3F4F6),
        ),
        new InkWell(
          child: new Container(
            height: 54.0,
            padding: new EdgeInsets.all(16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "地区",
                  style: new TextStyle(
                      color: const Color(0xFF333333), fontSize: 16.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      "上海",
                      style: new TextStyle(
                        color: const Color(0xFFACACAC),
                        fontSize: 15.0,
                      ),
                    ),
                    new Icon(
                      Icons.keyboard_arrow_right,
                      color: const Color(0xFFACACAC),
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () {},
        ),
        new MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: const Color(0xFFF3F4F6),
        ),
        new InkWell(
          child: new Container(
            height: 54.0,
            padding: new EdgeInsets.all(16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "个人简介",
                  style: new TextStyle(
                      color: const Color(0xFF333333), fontSize: 16.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      "几番离别，几番告白",
                      style: new TextStyle(
                        color: const Color(0xFFACACAC),
                        fontSize: 15.0,
                      ),
                    ),
                    new Icon(
                      Icons.keyboard_arrow_right,
                      color: const Color(0xFFACACAC),
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () {},
        ),
        new MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: const Color(0xFFF3F4F6),
        ),
      ],
    );
  }
}
