class Task {
  final String title;
  final String subTitle;
  final int followNum;
  final int joinNum;
  final String body;

  Task({
    this.title,
    this.subTitle,
    this.followNum,
    this.joinNum,
    this.body,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      subTitle: json['subTitle'],
      followNum: json['followNum'],
      joinNum: json['joinNum'],
      body: json['body'],
    );
  }
}
