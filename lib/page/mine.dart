import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xiaoman/app_router.dart';
import 'package:xiaoman/base/mcard.dart';
import 'package:xiaoman/config/application.dart';
import 'package:xiaoman/config/routes.dart';
import 'package:xiaoman/page/personal_info.dart';
import 'package:xiaoman/page/setting.dart';
import 'package:xiaoman/page/switch_role.dart';
import 'my_follow.dart';
import 'my_wallet.dart';

class Mine extends StatefulWidget {
  Mine({Key key}) : super(key: key);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new TopBar(),
      body: new MineBody(),
    );
  }
}

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  const TopBar({this.height, this.t});

  final double height;
  final double t;

  @override
  _TopBarState createState() => new _TopBarState();

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _TopBarState extends State<TopBar> {
  void showMenuSelection(String value) {
    //showInSnackBar('You selected: $value');
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double width = MediaQuery.of(context).size.width;
    return new Padding(
      padding: new EdgeInsets.only(top: statusBarHeight + 10.0),
      child: new SizedBox(
        width: width,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.only(left: 16.0),
              child: new Text(
                "我的",
                style: new TextStyle(
                  color: const Color(0xFF0D0E15),
                  fontSize: 32.0,
                ),
              ),
            ),
            new InkWell(
              child: new Container(
                height: 50.0,
                padding:
                    new EdgeInsets.only(right: 16.0, top: 10.0, bottom: 10.0),
                child: new Container(
                  padding: new EdgeInsets.only(right: 5.0, left: 5.0),
                  decoration: new BoxDecoration(
                    border: new Border.all(color: const Color(0xFFACACAC)),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(15.0)),
                  ),
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        "切换身份",
                        style: new TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFFACACAC),
                        ),
                      ),
                      new Icon(
                        Icons.arrow_downward,
                        color: const Color(0xFFACACAC),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new SwitchRole(),
                  ),
                );
              },
            )
//              child: new PopupMenuButton<String>(
//                icon: null,
//                child: new Container(
//                  padding: new EdgeInsets.only(right: 5.0, left: 5.0),
//                  decoration: new BoxDecoration(
//                    border: new Border.all(color: const Color(0xFFACACAC)),
//                    borderRadius:
//                        new BorderRadius.all(new Radius.circular(15.0)),
//                  ),
//                  child: new Row(
//                    children: <Widget>[
//                      new Text(
//                        "切换身份",
//                        style: new TextStyle(
//                          fontSize: 12.0,
//                          color: const Color(0xFFACACAC),
//                        ),
//                      ),
//                      new Icon(
//                        Icons.arrow_downward,
//                        color: const Color(0xFFACACAC),
//                      )
//                    ],
//                  ),
//                ),
//                onSelected: showMenuSelection,
//                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
//                      const PopupMenuItem<String>(
//                          value: 'id1', child: const Text('身份1')),
//                      const PopupMenuItem<String>(
//                          value: 'id2', child: const Text('身份2')),
//                      const PopupMenuItem<String>(
//                          value: 'id3', child: const Text('身份3')),
//                    ],
//              ),
          ],
        ),
      ),
    );
  }
}

class MineBody extends StatefulWidget {
  MineBody({Key key}) : super(key: key);

  @override
  _MineBodyState createState() => new _MineBodyState();
}

class _MineBodyState extends State<MineBody> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _buildTopCard(context),
        _buildBottom(context),
      ],
    );
  }
}

Widget _buildBottom(BuildContext context) {
  return new Column(
    children: <Widget>[
      new InkWell(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new MyWallet()),
          );
        },
        child: new Padding(
          padding: new EdgeInsets.only(left: 16.0, right: 16.0),
          child: new Container(
            height: 54.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(right: 10.0),
                      child: new Image.asset(
                        "assets/my_ic_joined.png",
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                    new Text(
                      "我参与的",
                      style: new TextStyle(
                          color: const Color(0xFF333333), fontSize: 16.0),
                    )
                  ],
                ),
                new IconButton(
                    padding: new EdgeInsets.only(left: 16.0),
                    icon: new Icon(Icons.keyboard_arrow_right),
                    onPressed: null),
              ],
            ),
          ),
        ),
      ),
      new Divider(height: 1.0, indent: 50.0, color: const Color(0xFFF3F4F6)),
      new InkWell(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new MyWallet()),
          );
        },
        child: new Padding(
          padding: new EdgeInsets.only(left: 16.0, right: 16.0),
          child: new Container(
            height: 54.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(right: 10.0),
                      child: new Image.asset(
                        "assets/my_ic_release.png",
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                    new Text(
                      "我发布的",
                      style: new TextStyle(
                          color: const Color(0xFF333333), fontSize: 16.0),
                    )
                  ],
                ),
                new IconButton(
                    padding: new EdgeInsets.only(left: 16.0),
                    icon: new Icon(Icons.keyboard_arrow_right),
                    onPressed: null),
              ],
            ),
          ),
        ),
      ),
      new Divider(height: 0.0, indent: 50.0, color: const Color(0xFFF3F4F6)),
      new InkWell(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new MyWallet()),
          );
        },
        child: new Padding(
          padding: new EdgeInsets.only(left: 16.0, right: 16.0),
          child: new Container(
            height: 54.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(right: 10.0),
                      child: new Image.asset(
                        "assets/my_ic_wallet.png",
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                    new Text(
                      "我的钱包",
                      style: new TextStyle(
                          color: const Color(0xFF333333), fontSize: 16.0),
                    )
                  ],
                ),
                new IconButton(
                    padding: new EdgeInsets.only(left: 16.0),
                    icon: new Icon(Icons.keyboard_arrow_right),
                    onPressed: null),
              ],
            ),
          ),
        ),
      ),
      new Divider(height: 1.0, indent: 50.0, color: const Color(0xFFF3F4F6)),
      new InkWell(
        onTap: () {
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new SettingPage()),
//          );
//          print("Routes.setting:" + Routes.setting);
//          if (Application.router == null) {
//            print("Application.router==null");
//            print("Application.router:" + Application.router.toString());
//          }
//          Application.router.navigateTo(
//            context,
//            "/setting",
//            transition: TransitionType.inFromRight,
//            transitionDuration: const Duration(milliseconds: 600),
//          );
          ApplicationRouter().router.navigateTo(
                context,
                "/setting",
                transition: TransitionType.inFromRight,



              );
        },
        child: new Padding(
          padding: new EdgeInsets.only(left: 16.0, right: 16.0),
          child: new Container(
            height: 54.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(right: 10.0),
                      child: new Image.asset(
                        "assets/my_ic_setting.png",
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                    new Text(
                      "设置",
                      style: new TextStyle(
                          color: const Color(0xFF333333), fontSize: 16.0),
                    )
                  ],
                ),
                new IconButton(
                    padding: new EdgeInsets.only(left: 16.0),
                    icon: new Icon(Icons.keyboard_arrow_right),
                    onPressed: null),
              ],
            ),
          ),
        ),
      ),
      new Divider(height: 1.0, indent: 50.0, color: const Color(0xFFF3F4F6)),
    ],
  );
}

Widget _buildTopCard(BuildContext context) {
  return new Container(
    padding: new EdgeInsets.all(15.0),
    child: new MCard(
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new InkWell(
                  child: new CircleAvatar(
                    radius: 30.0,
                    backgroundImage: new NetworkImage(
                      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new PersonalInfo()),
                    );
                  },
                ),
                new Container(
                  height: 60.0,
                  padding: new EdgeInsets.only(left: 20.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Text(
                        "劈里啪啦酱",
                        style: new TextStyle(
                          color: const Color(0xFF0D0E15),
                          fontSize: 24.0,
                        ),
                      ),
                      new Text(
                        "点击头像编辑个人资料",
                        style: new TextStyle(
                          color: const Color(0xFFACACAC),
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            new Container(
              padding: new EdgeInsets.only(left: 10.0, right: 10.0, top: 25.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MyFollow()),
                      );
                    },
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          "215",
                          style: new TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 24.0,
                          ),
                        ),
                        new Text(
                          "关注",
                          style: new TextStyle(
                            color: const Color(0xFF666666),
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  new InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MyFollow()),
                      );
                    },
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          "28",
                          style: new TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 24.0,
                          ),
                        ),
                        new Text(
                          "收藏",
                          style: new TextStyle(
                            color: const Color(0xFF666666),
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  new InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MyFollow()),
                      );
                    },
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          "897",
                          style: new TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 24.0,
                          ),
                        ),
                        new Text(
                          "历史",
                          style: new TextStyle(
                            color: const Color(0xFF666666),
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
