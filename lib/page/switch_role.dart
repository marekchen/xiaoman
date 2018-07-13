import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xiaoman/page/switch_role_view_model.dart';
import 'package:xiaoman/redux/app/app_state.dart';

class SwitchRole extends StatelessWidget {
  SwitchRole({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SwitchRoleViewModel>(
      distinct: true,
      converter: (store) => SwitchRoleViewModel.fromStore(store, context),
      builder: (_, viewModel) => SwitchRoleContent(viewModel),
    );
  }
}

class SwitchRoleContent extends StatelessWidget {
  SwitchRoleContent(this.viewModel);

  final SwitchRoleViewModel viewModel;

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
          "切换身份" +
              (viewModel.roleList == null ? 0 : viewModel.roleList.length)
                  .toString(),
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF8F9FA),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index < viewModel.roleList.length) {
            return UserListTile(index, viewModel);
          } else {
            return buildAddRoleTile();
          }
        },
        itemCount: viewModel.roleList == null ? 0 : viewModel.roleList.length +
            1,
      ),
    );
  }
}

buildAddRoleTile() {
  return Container(
    height: 100.0,
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
        Text(
          "添加身份",
          style: TextStyle(
            color: Color(0xFF768196),
            fontSize: 16.0,
          ),
        ),
      ],
    ),
  );
}

class UserListTile extends StatelessWidget {
  UserListTile(this.index, this.viewModel);

  final int index;
  final SwitchRoleViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        viewModel.roleList[index].nickname,
                        style: TextStyle(
                          color: Color(0xFF0D0E15),
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        viewModel.roleList[index].signature == null
                            ? ""
                            : viewModel.roleList[index].signature,
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
                  value: index,
                  groupValue: viewModel.currentIndex,
                  onChanged: (value) {
                    viewModel.switchRole(value);
                  }),
            ],
          ),
        ),
        Divider(height: 1.0, indent: 92.0, color: Color(0xFFF3F4F6)),
      ],
    );
  }
}
