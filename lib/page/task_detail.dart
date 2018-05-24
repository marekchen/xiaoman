import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:xiaoman/base/mcard.dart';
import 'package:xiaoman/model/task.dart';

const double _kAppBarHeight = 220.0;

class TaskDetailPage extends StatelessWidget {
  TaskDetailPage(this.task);

  final Task task;
  final _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color(0xFFF8F9FA),
      body: new NestedScrollView(
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
    return new SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      child: new SliverAppBar(
        pinned: true,
        forceElevated: innerBoxIsScrolled,
        backgroundColor: Colors.white,
        expandedHeight: _kAppBarHeight,
        flexibleSpace: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final Size size = constraints.biggest;
            final double appBarHeight = size.height - statusBarHeight;
            final double t = (appBarHeight - kToolbarHeight) /
                (_kAppBarHeight - kToolbarHeight);
            return new TopBar(
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

    return new SafeArea(
      top: false,
      bottom: false,
      child: new Builder(builder: (BuildContext context) {
        return new CustomScrollView(
          slivers: <Widget>[
            new SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate([
                new Container(
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          '224人关注 / 9人要参加',
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xFF768196),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        padding: new EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.symmetric(horizontal: 16.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new CupertinoButton(
                              child: const Text('关注任务'),
                              color: const Color(0xFF42BE56),
                              pressedOpacity: 0.2,
                              padding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 55.0),
                              minSize: 30.0,
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(4.0)),
                              onPressed: () {},
                            ),
                            new CupertinoButton(
                              child: const Text('接受任务'),
                              color: const Color(0xFF42BE56),
                              pressedOpacity: 0.2,
                              padding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 55.0),
                              minSize: 30.0,
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(4.0)),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        height: 20.0,
                      ),
//                    new Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      children: <Widget>[
//                        new RaisedButton(
//                          onPressed: () {},
//                          color: const Color(0xFF42BE56),
//                          padding: new EdgeInsets.symmetric(
//                              vertical: 10.0, horizontal: 50.0),
//                          shape: new RoundedRectangleBorder(
//                            borderRadius: new BorderRadius.circular(4.0),
//                          ),
//                          child: new Text(
//                            '关注任务',
//                            style: new TextStyle(
//                                fontSize: 16.0, color: Colors.white),
//                          ),
//                        ),
//                        new RaisedButton(
//                          onPressed: () {},
//                          highlightElevation: 0.0,
//                          color: const Color(0xFF42BE56),
//                          padding: new EdgeInsets.symmetric(
//                              vertical: 10.0, horizontal: 50.0),
//                          textColor: Colors.white,
//                          shape: new RoundedRectangleBorder(
//                            borderRadius: new BorderRadius.circular(4.0),
//                          ),
//                          child: new Text(
//                            '接收任务',
//                            style: new TextStyle(
//                                fontSize: 16.0, color: Colors.white),
//                          ),
//                        ),
//                      ],
//                    ),
                      new ExpansionDetail(html: html, html2: html2),
                      new Padding(
                        padding: new EdgeInsets.only(top: 20.0),
                        child: new Text('bottom'),
                      ),
                    ],
                  ),
                ),
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
  final Curve _textOpacity = const Interval(0.1, 1.0, curve: Curves.easeInOut);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    RectTween _backgroundRectTween = new RectTween(
      end: new Rect.fromLTWH(
          0.0, 0.0, width, _kAppBarHeight + statusBarHeight - 65.0),
      begin: new Rect.fromLTWH(0.0, 0.0, width, 20.0),
    );
    RectTween _taskHeaderRectTween = new RectTween(
      end: new Rect.fromLTWH(0.0, 115.0, width, 135.0),
      begin: new Rect.fromLTWH(0.0, 0.0, width, 135.0),
    );
    return new SizedBox(
      width: width,
      child: new Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          new Positioned.fromRect(
            rect: _backgroundRectTween.lerp(t),
            child: new Opacity(
              opacity: _textOpacity.transform(t),
              child: new Image.network(
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Positioned.fromRect(
            rect: _taskHeaderRectTween.lerp(t),
            child: new Opacity(
              opacity: _textOpacity.transform(t),
              child: new Container(
                padding: new EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
                child: new MCard(
                  color: new Color(0xFFFFFFFF),
                  radius: 8.0,
                  child: new Container(
                    padding: new EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                    child: new Text(
                      '「从化暗夜公园观星」 2天露营版，带给完全不一样的观星体验，亲近大自然。',
                      style: new TextStyle(
                        fontSize: 22.0,
                        color: const Color(0xFF333333),
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
  _ExpansionDetailState createState() => new _ExpansionDetailState();
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
    return new Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        new AnimatedCrossFade(
          firstChild: new HtmlView(data: widget.html),
          secondChild: new HtmlView(data: widget.html2),
          firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
          secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
        new AnimatedCrossFade(
          firstChild: new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  // red box
                  height: 160.0,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      begin: const Alignment(0.0, -1.0),
                      end: const Alignment(0.0, 0.6),
                      colors: <Color>[
                        const Color(0x00FCFDFD),
                        const Color(0xFFF8F9FA),
                      ],
                    ),
                  ),
                  padding: new EdgeInsets.all(16.0),
                ),
                new Container(
                  color: const Color(0xFFF8F9FA),
                  child: new InkWell(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          padding: new EdgeInsets.only(bottom: 10.0),
                          margin: new EdgeInsets.all(0.0),
                          color: const Color(0xFFF8F9FA),
                          child: new Text(
                            '展开活动活动详情',
                            style: new TextStyle(
                              color: const Color(0xFFADB5BD),
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: onTap,
                  ),
                ),
              ],
            ),
          ),
          secondChild: new Container(),
          firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
          secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
