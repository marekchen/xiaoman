import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

import '../base/mcard.dart';
import '../model/comment.dart';
import '../model/task.dart';
import '../widget/comment_card.dart';

double _kAppBarHeight = 220.0;

class TaskDetailPage extends StatelessWidget {
  TaskDetailPage(this.task);

  final Task task;
  final _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9ECEF),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            _buildAppBar(context, innerBoxIsScrolled),
          ];
        },
        body: _buildBody(),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, bool innerBoxIsScrolled) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      child: SliverAppBar(
        pinned: true,
        forceElevated: innerBoxIsScrolled,
        backgroundColor: Color(0xFFF8F9FA),
        expandedHeight: _kAppBarHeight,
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final Size size = constraints.biggest;
            final double appBarHeight = size.height - statusBarHeight;
            final double t = (appBarHeight - kToolbarHeight) /
                (_kAppBarHeight - kToolbarHeight);
            return TopBar(
              statusBarHeight: statusBarHeight,
              t: t,
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    String html = '<h1>This is heading 1</h1>'
        ' <h2>This is heading 2</h2>'
        '<h3>This is heading 3</h3>'
        '<h4>This is heading 4</h4>'
        '<h5>This is heading 5</h5>'
        '<h6>This is heading 6</h6>'
        '<p><img alt="Test Image" src="https://i.ytimg.com/vi/RHLknisJ-Sg/maxresdefault.jpg" /></p>'
        '<a href="https://baidu.com">Go Google</a> '
        '<a href="mailto:ponnamkarthik3@gmail.com">Mail to me</a>';

    String html2 = '<h1>This is heading 1</h1>'
        ' <h2>This is heading 2</h2>'
        '<h3>This is heading 3</h3>'
        '<h4>This is heading 4</h4>'
        '<h5>This is heading 5</h5>'
        '<h6>This is heading 6</h6>'
        '<video src="https://www.zhangxinxu.com/study/media/cat.mp4"></video>'
        '<p><img alt="Test Image" src="https://i.ytimg.com/vi/RHLknisJ-Sg/maxresdefault.jpg" width="104" height="142"/></p>'
        '<a href="https://baidu.com">Go Google</a>'
        '<a href="mailto:ponnamkarthik3@gmail.com">Mail to me</a> '
        '<p><u>uuuuuuuu</u><i>iiiiiiii</i><b>bbbbbbbb</b><a href="https://baidu.com">Go Google</a></p>'
        '<text>ttttttt</text>'
        '<text>ttttttt</text>'
        '<ol>'
        '<li>打开冰箱门</li>'
        '<li>把大象放进去</li>'
        '<li>关上冰箱门</li>'
        '</ol>'
        '<p><img alt="Test Image" src="https://i.ytimg.com/vi/RHLknisJ-Sg/maxresdefault.jpg" /></p>'
        '<h1>This is heading 1</h1>'
        ' <h2>This is heading 2</h2>'
        '<h3>This is heading 3</h3>'
        '<h4>This is heading 4</h4>'
        '<h5>This is heading 5</h5>'
        '<h6>This is heading 6</h6>'
        '<li>111</li>'
        '<p><img alt="Test Image" src="https://i.ytimg.com/vi/RHLknisJ-Sg/maxresdefault.jpg" /></p>'
        '<a href="https://baidu.com">Go Google</a> '
        '<a href="mailto:ponnamkarthik3@gmail.com">Mail to me</a> ';

    List<Comment> list = [
      Comment(
          userName: '二逼欢乐多',
          userAvatar:
              'http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg',
          likeNum: 556,
          replyNum: 322,
          content: '城里的月光把梦照亮'),
      Comment(
          userName: '二逼欢乐多',
          userAvatar:
              'http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg',
          likeNum: 556,
          replyNum: 322,
          content: '城里的月光把梦照亮，请温暖他心房，看透了人间聚散。'),
      Comment(
          userName: '二逼欢乐多',
          userAvatar:
              'http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg',
          likeNum: 556,
          replyNum: 322,
          content: '城里的月光把梦照亮，请温暖他心房，看透了人间聚散。'),
      Comment(
          userName: '二逼欢乐多',
          userAvatar:
              'http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg',
          likeNum: 556,
          replyNum: 322,
          content: '城里的月光把梦照亮，请温暖他心房，看透了人间聚散。'),
      Comment(
          userName: '二逼欢乐多',
          userAvatar:
              'http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg',
          likeNum: 556,
          replyNum: 322,
          content: '城里的月光把梦照亮，请温暖他心房，看透了人间聚散。'),
      Comment(
          userName: '二逼欢乐多',
          userAvatar:
              'http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg',
          likeNum: 556,
          replyNum: 322,
          content: '城里的月光把梦照亮，请温暖他心房，看透了人间聚散。'),
      Comment(
          userName: '二逼欢乐多',
          userAvatar:
              'http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg',
          likeNum: 556,
          replyNum: 322,
          content: '城里的月光把梦照亮，请温暖他心房，看透了人间聚散。'),
      Comment(
          userName: '二逼欢乐多',
          userAvatar:
              'http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg',
          likeNum: 556,
          replyNum: 322,
          content: '城里的月光把梦照亮，请温暖他心房，看透了人间聚散。'),
      Comment(
          userName: '二逼欢乐多',
          userAvatar:
              'http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg',
          likeNum: 556,
          replyNum: 322,
          content: '城里的月光把梦照亮，请温暖他心房，看透了人间聚散。'),
      Comment(
          userName: '二逼欢乐多',
          userAvatar:
              'http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg',
          likeNum: 556,
          replyNum: 322,
          content: '城里的月光把梦照亮，请温暖他心房，看透了人间聚散。'),
    ];

    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(builder: (BuildContext context) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  color: Color(0xFFF8F9FA),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '224人关注 / 9人要参加',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF768196),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CupertinoButton(
                              child: Text('关注任务'),
                              color: Color(0xFF42BE56),
                              pressedOpacity: 0.2,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 55.0),
                              minSize: 30.0,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4.0)),
                              onPressed: () {},
                            ),
                            CupertinoButton(
                              child: Text('接受任务'),
                              color: Color(0xFF42BE56),
                              pressedOpacity: 0.2,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 55.0),
                              minSize: 30.0,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4.0)),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 20.0,
                      ),
//                     Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      children: <Widget>[
//                         RaisedButton(
//                          onPressed: () {},
//                          color: Color(0xFF42BE56),
//                          padding:  EdgeInsets.symmetric(
//                              vertical: 10.0, horizontal: 50.0),
//                          shape:  RoundedRectangleBorder(
//                            borderRadius:  BorderRadius.circular(4.0),
//                          ),
//                          child:  Text(
//                            '关注任务',
//                            style:  TextStyle(
//                                fontSize: 16.0, color: Colors.white),
//                          ),
//                        ),
//                         RaisedButton(
//                          onPressed: () {},
//                          highlightElevation: 0.0,
//                          color: Color(0xFF42BE56),
//                          padding:  EdgeInsets.symmetric(
//                              vertical: 10.0, horizontal: 50.0),
//                          textColor: Colors.white,
//                          shape:  RoundedRectangleBorder(
//                            borderRadius:  BorderRadius.circular(4.0),
//                          ),
//                          child:  Text(
//                            '接收任务',
//                            style:  TextStyle(
//                                fontSize: 16.0, color: Colors.white),
//                          ),
//                        ),
//                      ],
//                    ),
                      ExpansionDetail(html: html, html2: html2),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 54.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '日程安排',
                                style: TextStyle(
                                    color: Color(0xFF0D0E15),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "2018.01.06 周六起",
                                    style: TextStyle(
                                        color: Color(0xFF768196),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFF768196),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                          height: 1.0, color: Color(0xFFE9ECEF)),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 54.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '团队属性',
                                style: TextStyle(
                                    color: Color(0xFF0D0E15),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "单人活动",
                                    style: TextStyle(
                                        color: Color(0xFF768196),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFF768196),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                          height: 1.0, color: Color(0xFFE9ECEF)),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 54.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '权限管理',
                                style: TextStyle(
                                    color: Color(0xFF0D0E15),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "公共活动",
                                    style: TextStyle(
                                        color: Color(0xFF768196),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFF768196),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                          height: 1.0, color: Color(0xFFE9ECEF)),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 54.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '直播管理',
                                style: TextStyle(
                                    color: Color(0xFF0D0E15),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "本活动开通直播",
                                    style: TextStyle(
                                        color: Color(0xFF768196),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFF768196),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                          height: 1.0, color: Color(0xFFE9ECEF)),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  color: Color(0xFFF8F9FA),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 14.0,
                  ),
                  color: Color(0xFFF8F9FA),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 16.0,
                                  width: 4.0,
                                  color: Color(0xFF42BE56),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    "热门评论",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xFF0D0E15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "更多热门评论",
                                  style: TextStyle(
                                      color: Color(0xFF768196),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF768196),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        height: 42.0,
                      ),
                      Divider(
                          height: 1.0, color: Color(0xFFE9ECEF)),
//                       ListView.builder(
//                        itemBuilder: (context, index) {
//                          return  CommentCard(comment: list[index]);
//                          //return  Container(height: 20.0,);
//                        },
//                        itemCount: 10,
//                        shrinkWrap: true,
//                      )
                      CommentCard(comment: list[0]),
                      CommentCard(comment: list[1]),
                      CommentCard(comment: list[2]),
                      CommentCard(comment: list[3]),
                      CommentCard(comment: list[4]),
                      CommentCard(comment: list[5]),
                      CommentCard(comment: list[6]),
                      CommentCard(comment: list[7]),
                      CommentCard(comment: list[8]),
                      CommentCard(comment: list[9]),
                    ],
                  ),
                )
              ]),
            ),
          ],
        );
      }),
    );
  }
}

class TopBar extends StatelessWidget {
  TopBar({
    this.statusBarHeight,
    this.t,
  });

  final double statusBarHeight;
  final double t;
  final Curve _textOpacity = Interval(0.1, 1.0, curve: Curves.easeInOut);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    RectTween _backgroundRectTween = RectTween(
      end: Rect.fromLTWH(
          0.0, 0.0, width, _kAppBarHeight + statusBarHeight - 65.0),
      begin: Rect.fromLTWH(0.0, 0.0, width, 20.0),
    );
    RectTween _taskHeaderRectTween = RectTween(
      end: Rect.fromLTWH(0.0, 115.0, width, 135.0),
      begin: Rect.fromLTWH(0.0, 0.0, width, 135.0),
    );
    return SizedBox(
      width: width,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned.fromRect(
            rect: _backgroundRectTween.lerp(t),
            child: Opacity(
              opacity: _textOpacity.transform(t),
              child: Image.network(
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fromRect(
            rect: _taskHeaderRectTween.lerp(t),
            child: Opacity(
              opacity: _textOpacity.transform(t),
              child: Container(
                padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
                child: MCard(
                  color: Colors.white,
                  radius: 8.0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                    child: Text(
                      '「从化暗夜公园观星」 2天露营版，带给完全不一样的观星体验，亲近大自然。',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpansionDetail extends StatefulWidget {
  ExpansionDetail({
    Key key,
    this.html,
    this.html2,
  }) : super(key: key);

  final html;
  final html2;

  @override
  _ExpansionDetailState createState() => _ExpansionDetailState();
}

class _ExpansionDetailState extends State<ExpansionDetail> {
  bool _isExpanded = false;

  void onTap() {
    setState(() {
      this._isExpanded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        AnimatedCrossFade(
          firstChild: HtmlView(data: widget.html),
          secondChild: HtmlView(data: widget.html2),
          firstCurve: Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
          secondCurve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 200),
        ),
        AnimatedCrossFade(
          firstChild: Center(
            child: Column(
              children: <Widget>[
                Container(
                  // red box
                  height: 160.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, 0.6),
                      colors: <Color>[
                        Color(0x00FCFDFD),
                        Color(0xFFF8F9FA),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(16.0),
                ),
                Container(
                  height: 44.0,
                  color: Color(0xFFF8F9FA),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '展开查看活动详情',
                          style: TextStyle(
                            color: Color(0xFFADB5BD),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFFADB5BD),
                        ),
                      ],
                    ),
                    onTap: onTap,
                  ),
                ),
              ],
            ),
          ),
          secondChild: Container(),
          firstCurve: Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
          secondCurve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
