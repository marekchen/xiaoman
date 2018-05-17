class Article {
  final String userName;
  final String userAvatar;

  final List<String> pictures;
  final String content;
  final List<Comment> commentList;

  Article(
      {this.userName,
      this.userAvatar,
      this.pictures,
      this.content,
      this.commentList});

  factory Article.fromJson(Map<String, dynamic> json) {
    return new Article(
      userName: json['userName'],
      userAvatar: json['userAvatar'],
      pictures: json['pictures'],
      content: json['content'],
      commentList: json['commentList'],
    );
  }
}

class Comment {
  final String userName;
  final String content;

  Comment({this.userName, this.content});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return new Comment(
      userName: json['userName'],
      content: json['content'],
    );
  }
}
