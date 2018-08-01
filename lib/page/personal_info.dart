import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:xiaoman/model/user.dart';
import 'package:xiaoman/redux/user/user_actions.dart';
import 'package:xiaoman/base/m_divider.dart';
import 'package:xiaoman/redux/app/app_state.dart';

class PersonalInfoViewModel {
  PersonalInfoViewModel(
      {@required this.token,
      @required this.currentUser,
      @required this.logout});

  final String token;
  final User currentUser;
  final Function logout;

  static PersonalInfoViewModel fromStore(
      Store<AppState> store, BuildContext context) {
    return PersonalInfoViewModel(
      token: store.state.userState.token,
      currentUser: store.state.userState.currentUser,
      logout: () => store.dispatch(LogoutAction(context)),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalInfoViewModel &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          currentUser == other.currentUser &&
          logout == other.logout;

  @override
  int get hashCode => token.hashCode ^ currentUser.hashCode ^ logout.hashCode;
}

class PersonalInfo extends StatelessWidget {
  PersonalInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PersonalInfoViewModel>(
      distinct: true,
      converter: (store) => PersonalInfoViewModel.fromStore(store, context),
      builder: (_, viewModel) => PersonalInfoContent(viewModel),
    );
  }
}

class PersonalInfoContent extends StatelessWidget {
  PersonalInfoContent(this.viewModel);

  final PersonalInfoViewModel viewModel;

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
          "个人信息",
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF8F9FA),
      body: Body(viewModel),
    );
  }
}

class Body extends StatelessWidget {
  Body(this.viewModel);

  final PersonalInfoViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Divider(height: 0.0, color: Color(0xFFF3F4F6)),
          InkWell(
            child: Ink(
              height: 100.0,
              color: Colors.white,
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
                      Ink(
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                            viewModel.currentUser?.avatar != null &&
                                    viewModel.currentUser?.avatar != ""
                                ? viewModel.currentUser?.avatar
                                : "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                          ),
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
                            ImagePicker.pickImage(source: ImageSource.gallery)
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
                            ImagePicker.pickImage(source: ImageSource.camera)
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
            child: Ink(
              height: 54.0,
              color: Colors.white,
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
                        viewModel.currentUser?.nickname != null
                            ? viewModel.currentUser?.nickname
                            : "未设置",
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
          new Container(
            margin: new EdgeInsets.only(top: 9.0),
            child: InkWell(
              child: Ink(
                height: 54.0,
                color: Colors.white,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "性别",
                      style:
                          TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          viewModel.currentUser?.gender != null
                              ? viewModel.currentUser?.gender.toString()
                              : "未知",
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
          ),
          MDivider(
            indent: 16.0,
            endIndent: 16.0,
            height: 0.0,
            color: Color(0xFFF3F4F6),
          ),
          InkWell(
            child: Ink(
              height: 54.0,
              color: Colors.white,
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
            child: Ink(
              height: 54.0,
              color: Colors.white,
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
                        viewModel.currentUser?.signature != null
                            ? viewModel.currentUser?.signature
                            : "什么都没写！",
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
          new Container(
            margin: new EdgeInsets.only(top: 18.0),
            child: InkWell(
              child: Ink(
                height: 54.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "退出登录",
                      style:
                          TextStyle(color: Color(0xFFF6534F), fontSize: 22.0),
                    ),
                  ],
                ),
              ),
              onTap: () {
                viewModel.logout();
              },
            ),
          )
        ],
      ),
    );
  }
}
