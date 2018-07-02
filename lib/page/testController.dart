import 'package:flutter/material.dart';
import 'package:xiaoman/model/event.dart';
import 'package:xiaoman/widget/event_card.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<TestPage>
    with SingleTickerProviderStateMixin<TestPage> {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    if (tabController == null) {
      tabController = TabController(vsync: this, length: 3);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        tabs: [
          const Tab(text: 'Now in theaters'),
          const Tab(text: 'Showtimes'),
          const Tab(text: 'Coming soon'),
        ],
        controller: tabController,
      ),
      body: _buildBody(context, tabController),
    );
  }

  Widget _buildBody(BuildContext context, TabController tabController) {
    return TabBarView(
      controller: tabController,
      children: [
        _buildTab(context, 1),
        _buildTab(context, 2),
        _buildTab(context, 3),
      ],
    );
  }

  Widget _buildTab(BuildContext context, int type) {

    ScrollController _controller = new ScrollController(
      initialScrollOffset: 0.0,
    );

    return ListView.builder(
        controller: _controller,
        key: PageStorageKey<String>("discovery" + type.toString()),
        itemBuilder: (BuildContext context, int index) {
          print("xiaoman::::" + index.toString());
          return EventCard(event: event);
        },
        itemCount: 30);
  }
}

Event event = Event(
  userAvatar:
      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
  userName: "霹雳巴拉酱",
  eventType: 1,
  pictures: [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg",
//    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=927480163,3727066344&fm=27&gp=0.jpg",
//    "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3774731071,361198447&fm=27&gp=0.jpg",
//    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2233345096,4117074648&fm=27&gp=0.jpg",
  ],
  title: "我是任务标题，是啥任务咧，点我瞧瞧",
  body: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧",
  followNum: 300,
  joinNum: 143,
);

Event event2 = Event(
  userAvatar:
      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
  userName: "霹雳222",
  eventType: 2,
  pictures: [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1665207864,746409922&fm=27&gp=0.jpg",
  ],
  title: "我是任务标题，是啥任务咧，22222",
  body: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧",
  likeNum: 1000,
  commentNum: 143,
);

Event event3 = Event(
  userAvatar:
      "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
  userName: "霹雳333333",
  eventType: 3,
  pictures: [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3169300040,1868474930&fm=27&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1665207864,746409922&fm=27&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=426595056,3152484396&fm=27&gp=0.jpg",
  ],
  title: "我是任务标题，是啥任务咧，333333",
  body: "我是任务标题，是啥任务咧，点我瞧瞧是啥任务咧，点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧点我瞧瞧",
  likeNum: 1000,
  commentNum: 143,
);
