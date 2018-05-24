class Task {
  final String name;
  final int followNum;
  final int joinNum;
  final String content;

  Task({
    this.name,
    this.followNum,
    this.joinNum,
    this.content,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return new Task(
      name: json['name'],
      followNum: json['followNum'],
      joinNum: json['joinNum'],
      content: json['content'],
    );
  }
}
