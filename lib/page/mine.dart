import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fluro/fluro.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:xiaoman/app.dart';
import 'package:xiaoman/base/m_card.dart';
import 'package:xiaoman/redux/app/app_state.dart';
import 'package:xiaoman/model/user.dart';
import 'package:xiaoman/redux/user/user_actions.dart';

class MineViewModel {
  MineViewModel(
      {@required this.token,
        @required this.currentUser,
        @required this.getRoleList});

  final String token;
  final User currentUser;
  final Function getRoleList;

  static MineViewModel fromStore(Store<AppState> store, BuildContext context) {
    return MineViewModel(
      token: store.state.userState.token,
      currentUser: store.state.userState.currentUser,
      getRoleList: () => store.dispatch(GetRoleListAction(context)),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MineViewModel &&
              runtimeType == other.runtimeType &&
              token == other.token &&
              currentUser == other.currentUser &&
              getRoleList == other.getRoleList;

  @override
  int get hashCode =>
      token.hashCode ^ currentUser.hashCode ^ getRoleList.hashCode;
}


class MinePage extends StatelessWidget {
  MinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MineViewModel>(
      distinct: true,
      converter: (store) => MineViewModel.fromStore(store, context),
      builder: (_, viewModel) => MinePageContent(viewModel),
    );
  }
}

class MinePageContent extends StatelessWidget {
  MinePageContent(this.viewModel);

  final MineViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopBar(viewModel),
      body: MineBody(viewModel),
    );
  }
}

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  TopBar(this.viewModel);

  final MineViewModel viewModel;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

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
                App().router.navigateTo(
                      context,
                      "/switchRole",
                      transition: TransitionType.inFromRight,
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MineBody extends StatelessWidget {
  MineBody(this.viewModel);

  final MineViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTopCard(context, viewModel),
        _buildBottom(context, viewModel),
      ],
    );
  }
}

Widget _buildTopCard(BuildContext context, MineViewModel viewModel) {
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
                      viewModel.currentUser?.avatar != null && viewModel.currentUser?.avatar != ""
                          ? viewModel.currentUser?.avatar
                          : "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                    ),
                  ),
                  onTap: () {
                    var pageName = "";
                    if (viewModel.currentUser == null) {
                      pageName = "login";
                    } else {
                      pageName = "personalInfo";
                    }
                    App().router.navigateTo(
                          context,
                          pageName,
                          transition: TransitionType.inFromRight,
                        );
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          viewModel.currentUser?.nickname != null
                              ? viewModel.currentUser?.nickname
                              : "登录/注册",
                          style: TextStyle(
                            color: Color(0xFF0D0E15),
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          viewModel.token != null ? "点击编辑个人资料" : "",
                          style: TextStyle(
                            color: Color(0xFFACACAC),
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      var pageName = "";
                      if (viewModel.currentUser == null) {
                        pageName = "login";
                      } else {
                        pageName = "personalInfo";
                      }
                      App().router.navigateTo(
                        context,
                        pageName,
                        transition: TransitionType.inFromRight,
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkResponse(
                    onTap: () {
                      App().router.navigateTo(
                            context,
                            "/myFollow",
                            transition: TransitionType.inFromRight,
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
                  InkResponse(
                    onTap: () {
                      App().router.navigateTo(
                            context,
                            "/myFollow",
                            transition: TransitionType.inFromRight,
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
                  InkResponse(
                    onTap: () {
                      App().router.navigateTo(
                            context,
                            "/myFollow",
                            transition: TransitionType.inFromRight,
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

Widget _buildBottom(BuildContext context, MineViewModel viewModel) {
  return Column(
    children: <Widget>[
      InkWell(
        onTap: () {
          App().router.navigateTo(
                context,
                "/myWallet",
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
          App().router.navigateTo(
                context,
                "/myWallet",
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
          App().router.navigateTo(
                context,
                "/myWallet",
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
