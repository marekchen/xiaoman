import 'package:meta/meta.dart';

class User {
  User({
    @required this.userId,
    @required this.nickname,
    @required this.avatar,
    this.rongToken,
    this.focusCount,
    this.gender,
    this.signature,
    this.collectCount,
  });

  String userId;
  String nickname;
  String avatar;
  String rongToken;
  int focusCount;
  int gender;
  String signature;
  int collectCount;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'] as String,
      nickname: json['nickname'] as String,
      avatar: json['avatar'] as String,
      rongToken: json['rongToken'] as String,
      focusCount: json['focusCount'] as int,
      gender: json['gender'] as int,
      signature: json['signature'] as String,
      collectCount: json['collectCount'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'nickname': nickname,
        'avatar': avatar,
        'rongToken': rongToken,
        'focusCount': focusCount,
        'gender': gender,
        'signature': signature,
        'collectCount': collectCount
      };
}
