class Comment {
  final String userName;
  final String userAvatar;
  final String content;
  final int likeNum;
  final int replyNum;

  Comment(
      {this.userName,
      this.userAvatar,
      this.content,
      this.likeNum,
      this.replyNum});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return new Comment(
      userName: json['userName'],
      userAvatar: json['userAvatar'],
      content: json['content'],
      likeNum: json['likeNum'],
      replyNum: json['replyNum'],
    );
  }
}
