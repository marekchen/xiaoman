import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:json_serializable/json_serializable.dart';

@JsonSerializable(nullable: false)
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
