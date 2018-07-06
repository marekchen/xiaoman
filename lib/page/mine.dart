import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../app.dart';
import '../base/mcard.dart';
import './personal_info.dart';
import './switch_role.dart';
import './my_follow.dart';
import './my_wallet.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopBar(),
      body: MineBody(),
    );
  }
}

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  TopBar({this.height, this.t});

  final double height;
  final double t;

  @override
  _TopBarState createState() => _TopBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TopBarState extends State<TopBar> {
  void showMenuSelection(String value) {
    //showInSnackBar('You selected: $value');
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight + 10.0),
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                "我的",
                style: TextStyle(
                  color: Color(0xFF0D0E15),
                  fontSize: 32.0,
                ),
              ),
            ),
            InkWell(
              child: Container(
                height: 50.0,
                padding: EdgeInsets.only(right: 16.0, top: 10.0, bottom: 10.0),
                child: Container(
                  padding: EdgeInsets.only(right: 5.0, left: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFACACAC)),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "切换身份",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFACACAC),
                        ),
                      ),
                      Icon(
                        Icons.arrow_downward,
                        color: Color(0xFFACACAC),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SwitchRole(),
                  ),
                );
              },
            )
//              child:  PopupMenuButton<String>(
//                icon: null,
//                child:  Container(
//                  padding:  EdgeInsets.only(right: 5.0, left: 5.0),
//                  decoration:  BoxDecoration(
//                    border:  Border.all(color: Color(0xFFACACAC)),
//                    borderRadius:
//                         BorderRadius.all( Radius.circular(15.0)),
//                  ),
//                  child:  Row(
//                    children: <Widget>[
//                       Text(
//                        "切换身份",
//                        style:  TextStyle(
//                          fontSize: 12.0,
//                          color: Color(0xFFACACAC),
//                        ),
//                      ),
//                       Icon(
//                        Icons.arrow_downward,
//                        color: Color(0xFFACACAC),
//                      )
//                    ],
//                  ),
//                ),
//                onSelected: showMenuSelection,
//                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
//                      PopupMenuItem<String>(
//                          value: 'id1', child: Text('身份1')),
//                      PopupMenuItem<String>(
//                          value: 'id2', child: Text('身份2')),
//                      PopupMenuItem<String>(
//                          value: 'id3', child: Text('身份3')),
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
  _MineBodyState createState() => _MineBodyState();
}

class _MineBodyState extends State<MineBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTopCard(context),
        _buildBottom(context),
      ],
    );
  }
}

Widget _buildBottom(BuildContext context) {
  return Column(
    children: <Widget>[
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyWallet()),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Container(
            height: 54.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        "assets/my_ic_joined.png",
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                    Text(
                      "我参与的",
                      style:
                          TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                    )
                  ],
                ),
                IconButton(
                    padding: EdgeInsets.only(left: 16.0),
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: null),
              ],
            ),
          ),
        ),
      ),
      Divider(height: 1.0, indent: 50.0, color: Color(0xFFF3F4F6)),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyWallet()),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Container(
            height: 54.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        "assets/my_ic_release.png",
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                    Text(
                      "我发布的",
                      style:
                          TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                    )
                  ],
                ),
                IconButton(
                    padding: EdgeInsets.only(left: 16.0),
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: null),
              ],
            ),
          ),
        ),
      ),
      Divider(height: 0.0, indent: 50.0, color: Color(0xFFF3F4F6)),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyWallet()),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Container(
            height: 54.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        "assets/my_ic_wallet.png",
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                    Text(
                      "我的钱包",
                      style:
                          TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                    )
                  ],
                ),
                IconButton(
                    padding: EdgeInsets.only(left: 16.0),
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: null),
              ],
            ),
          ),
        ),
      ),
      Divider(height: 1.0, indent: 50.0, color: Color(0xFFF3F4F6)),
      InkWell(
        onTap: () {
          App().router.navigateTo(
                context,
                "/setting",
                transition: TransitionType.inFromRight,
              );
        },
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Container(
            height: 54.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        "assets/my_ic_setting.png",
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                    Text(
                      "设置",
                      style:
                          TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                    )
                  ],
                ),
                IconButton(
                    padding: EdgeInsets.only(left: 16.0),
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: null),
              ],
            ),
          ),
        ),
      ),
      Divider(height: 1.0, indent: 50.0, color: Color(0xFFF3F4F6)),
    ],
  );
}

Widget _buildTopCard(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(15.0),
    child: MCard(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                InkWell(
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PersonalInfo()),
                    );
                  },
                ),
                Container(
                  height: 60.0,
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "劈里啪啦酱",
                        style: TextStyle(
                          color: Color(0xFF0D0E15),
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        "点击头像编辑个人资料",
                        style: TextStyle(
                          color: Color(0xFFACACAC),
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyFollow()),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Text(
                          "215",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          "关注",
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyFollow()),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Text(
                          "28",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          "收藏",
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyFollow()),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Text(
                          "897",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          "历史",
                          style: TextStyle(
                            color: Color(0xFF666666),
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
