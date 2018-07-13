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

  final String userId;
  final String nickname;
  final String avatar;
  final String rongToken;
  final int focusCount;
  final int gender;
  final String signature;
  final int collectCount;
}
