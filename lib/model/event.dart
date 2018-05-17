class Event {
  final String userName;
  final String userAvatar;

  final int eventType;
  final String title;
  final List<String> pictures;
  final String body;

  final int followNum;
  final int joinNum;
  final int likeNum;
  final int commentNum;

  Event({
    this.userName,
    this.userAvatar,
    this.eventType,
    this.title,
    this.pictures,
    this.body,
    this.followNum,
    this.joinNum,
    this.likeNum,
    this.commentNum,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return new Event(
      userName: json['userName'],
      userAvatar: json['userAvatar'],
      eventType: json['eventType'],
      title: json['title'],
      pictures: json['pictures'],
      body: json['body'],
      followNum: json['followNum'],
      joinNum: json['joinNum'],
      likeNum: json['likeNum'],
      commentNum: json['commentNum'],
    );
  }
}
