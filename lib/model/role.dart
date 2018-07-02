import 'package:meta/meta.dart';

class User {
  User({
    @required this.nickname,
    @required this.avatar,
    @required this.focusCount,
    @required this.rongToken,
    @required this.gender,
    @required this.signature,
    @required this.collectCount,
  });

  final String nickname;
  final String avatar;
  final int focusCount;
  final String rongToken;
  final int gender;
  final String signature;
  final int collectCount;
}