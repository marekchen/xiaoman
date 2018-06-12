import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

enum ConversationType {
  NONE,
  PRIVATE,
  DISCUSSION,
  GROUP,
  CHATROOM,
  CUSTOMER_SERVICE,
  SYSTEM,
  APP_PUBLIC_SERVICE,
  PUBLIC_SERVICE,
  PUSH_SERVICE,
}

ConversationType conversationTypeFromInt(int value) {
  print("value:" + value.toString());
  return ConversationType.values.firstWhere((md) => md.index == value);
}

class Response {
  int code;
  int errorCode;
  String errorInfo;
  dynamic result;
}

class UserInfo {
  String id;
  String name;
  Uri portraitUri;

  UserInfo(this.id, this.name, this.portraitUri);

  toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      "id": id,
      "name": name,
      "portraitUri": portraitUri.path,
    };
    return map;
  }

  factory UserInfo.fromJson(Map<dynamic, dynamic> json) {
    UserInfo userInfo = new UserInfo(
      json['id'],
      json['name'],
      Uri.parse(json['portraitUri']),
    );
    return userInfo;
  }
}

enum MentionedType {
  NONE,
  ALL,
  PART,
}

MentionedType mentionedTypeFromInt(int value) {
  return MentionedType.values.firstWhere((md) => md.index == value);
}

enum MessageDirection {
  NONE,
  SEND,
  RECEIVE,
}

MessageDirection messageDirectionFromInt(int value) {
  return MessageDirection.values.firstWhere((md) => md.index == value);
}

class MentionedInfo {
  MentionedType type;
  List<String> userIdList;
  String mentionedContent;

  MentionedInfo(this.type, this.userIdList, this.mentionedContent);

  toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      "type": type.index,
      "userIdList": userIdList,
      "mentionedContent": mentionedContent,
    };
    return map;
  }

  factory MentionedInfo.fromJson(Map<dynamic, dynamic> json) {
    MentionedInfo mentionedInfo = new MentionedInfo(
      mentionedTypeFromInt(json['type']),
      json['userIdList'],
      json['mentionedContent'],
    );
    return mentionedInfo;
  }
}

class MessageContent {
  UserInfo userInfo;
  MentionedInfo mentionedInfo;

  setUserInfo(UserInfo userInfo) {
    this.userInfo = userInfo;
  }

  setMentionedInfo(MentionedInfo mentionedInfo) {
    this.mentionedInfo = mentionedInfo;
  }

  toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map.putIfAbsent("userInfo", () => userInfo);
    map.putIfAbsent("mentionedInfo", () => mentionedInfo);
    return map;
  }
}

class Message {
  String targetId;
  ConversationType conversationType;
  MessageContent content;
  String pushContent;
  String pushData;

  int messageId;
  String senderUserId;
  MessageDirection messageDirection;
  String objectName; // RC:TxtMsg RC:ImgMsg RC:VcMsg RC:RcNtf RC:FileMsg

  num sentTime;
  num receivedTime;
  String extra;

  Message(this.targetId, this.conversationType, this.content);

  toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      "targetId": targetId,
      "conversationType": conversationType.index,
      "content": content.toMap(),
    };
    map.putIfAbsent("pushContent", () => pushContent);
    map.putIfAbsent("pushData", () => pushData);

    map.putIfAbsent("messageId", () => messageId);
    map.putIfAbsent("senderUserId", () => senderUserId);
    if (messageDirection != null) {
      map.putIfAbsent("messageDirection", () => messageDirection.index);
    }
    map.putIfAbsent("objectName", () => objectName);

    map.putIfAbsent("sentTime", () => sentTime);
    map.putIfAbsent("receivedTime", () => receivedTime);
    map.putIfAbsent("extra", () => extra);
    return map;
  }

  factory Message.fromJson(Map<dynamic, dynamic> json) {
    Message message = new Message(
      json['targetId'],
      conversationTypeFromInt(json['conversationType']),
      parseMessageContent(json["objectName"], json["content"]),
    );

    message.messageId = json["messageId"];
    message.senderUserId = json["senderUserId"];
    message.messageDirection =
        messageDirectionFromInt(json["messageDirection"]);

    message.objectName = json["objectName"];
    message.sentTime = json["sentTime"];
    message.receivedTime = json["receivedTime"];
    message.extra = json["extra"];
    return message;
  }

  static MessageContent parseMessageContent(
      String objectName, Map<dynamic, dynamic> json) {
    MessageContent content;
    switch (objectName) {
      case "RC:TxtMsg":
        content = TextMessage.fromJson(json);
        break;
      case "RC:LBSMsg":
        content = LocationMessage.fromJson(json);
        break;
      case "RC:ImgMsg":
        content = ImageMessage.fromJson(json);
        break;
      case "RC:VcMsg":
        break;
      case "RC:FileMsg":
        content = FileMessage.fromJson(json);
        break;
      case "RC:RcNtf":
        break;
    }
    return content;
  }
}

class TextMessage extends MessageContent {
  String content;

  String extra;

  TextMessage(this.content);

  toMap() {
    Map<String, dynamic> superMap = super.toMap();
    Map<String, dynamic> map = {
      "content": content,
    };
    map.addAll(superMap);
    return map;
  }

  factory TextMessage.fromJson(Map<dynamic, dynamic> json) {
    TextMessage message = new TextMessage(
      json['content'],
    );
    if (json.containsKey("userInfo")) {
      message.setUserInfo(UserInfo.fromJson(json['userInfo']));
    }
    if (json.containsKey("mentionedInfo")) {
      message.setMentionedInfo(MentionedInfo.fromJson(json['mentionedInfo']));
    }
    if (json.containsKey("extra")) {
      message.extra = json['extra'];
    }
    return message;
  }
}

class LocationMessage extends MessageContent {
  double lat;
  double lng;
  String poi;
  Uri imgUri;

  LocationMessage(this.lat, this.lng, this.poi, this.imgUri);

  toMap() {
    Map<String, dynamic> superMap = super.toMap();
    Map<String, dynamic> map = {
      "lat": lat,
      "lng": lng,
      "poi": poi,
      "imgUri": imgUri.toString(),
    };
    map.addAll(superMap);
    return map;
  }

  factory LocationMessage.fromJson(Map<dynamic, dynamic> json) {
    LocationMessage message = new LocationMessage(
      json['lat'],
      json['lng'],
      json['poi'],
      json['imgUri'],
    );
    if (json.containsKey("userInfo")) {
      message.setUserInfo(UserInfo.fromJson(json['userInfo']));
    }
    if (json.containsKey("mentionedInfo")) {
      message.setMentionedInfo(MentionedInfo.fromJson(json['mentionedInfo']));
    }
    return message;
  }
}

class ImageMessage extends MediaMessageContent {
  Uri thumbUri;
  bool isFull;

  ImageMessage({
    @required Uri thumbUri,
    @required Uri localUri,
    bool isFull = true,
  }) : super(localUri) {
    this.thumbUri = thumbUri;
    this.isFull = isFull;
  }

  toMap() {
    Map<String, dynamic> superMap = super.toMap();
    Map<String, dynamic> map = {
      "thumbUri": thumbUri.toString(),
      "localUri": localPath.toString(),
      "isFull": isFull,
    };
    if (mediaUrl != null) {
      map.putIfAbsent("remoteUri", () => mediaUrl.toString());
    }
    map.addAll(superMap);
    return map;
  }

  factory ImageMessage.fromJson(Map<dynamic, dynamic> json) {
    ImageMessage message = new ImageMessage(
        thumbUri: Uri.parse(json['thumbUri']),
        localUri: Uri.parse(json['localUri']),
        isFull: json['isFull']);
    if (json.containsKey("userInfo")) {
      message.setUserInfo(UserInfo.fromJson(json['userInfo']));
    }
    if (json.containsKey("mentionedInfo")) {
      message.setMentionedInfo(MentionedInfo.fromJson(json['mentionedInfo']));
    }
    if (json.containsKey("extra")) {
      message.extra = json['extra'];
    }
    if (json.containsKey("mediaUrl")) {
      message.mediaUrl = Uri.parse(json['mediaUrl']);
    }
    return message;
  }
}

class MediaMessageContent extends MessageContent {
  Uri localPath;
  Uri mediaUrl;
  String extra;

  MediaMessageContent(this.localPath);

  toMap() {
    Map<String, dynamic> superMap = super.toMap();
    return superMap;
  }
}

class FileMessage extends MediaMessageContent {
  FileMessage(Uri localUri) : super(localUri);

  toMap() {
    Map<String, dynamic> superMap = super.toMap();
    Map<String, dynamic> map = <String, dynamic>{
      "localUri": localPath.toString(),
      "extra": extra,
    };
    if (mediaUrl != null) {
      map.putIfAbsent("fileUrl", () => mediaUrl.toString());
    }
    map.addAll(superMap);
    return map;
  }

  factory FileMessage.fromJson(Map<dynamic, dynamic> json) {
    FileMessage message = new FileMessage(Uri.parse(json['localUri']));
    if (json.containsKey("userInfo")) {
      message.setUserInfo(UserInfo.fromJson(json['userInfo']));
    }
    if (json.containsKey("mentionedInfo")) {
      message.setMentionedInfo(MentionedInfo.fromJson(json['mentionedInfo']));
    }
    if (json.containsKey("extra")) {
      message.extra = json['extra'];
    }
    if (json.containsKey("mediaUrl")) {
      message.mediaUrl = Uri.parse(json['mediaUrl']);
    }
    return message;
  }
}

class RongCloud {
  static const MethodChannel _channel =
      const MethodChannel('marekchen.github.com/rongcloud');

  static const EventChannel _channel_event =
      const EventChannel('marekchen.github.com/rongcloud-event');

  static Future<Response> connect(String token) async {
    final Map<dynamic, dynamic> result = await _channel
        .invokeMethod('connect', <String, dynamic>{'token': token});
    Response response = new Response();
    response.code = result["Code"];
    response.errorInfo = result["ErrorInfo"];
    return response;
  }

  static Future<Response> disconnect() async {
    final Map<dynamic, dynamic> result =
        await _channel.invokeMethod('disconnect');
    Response response = new Response();
    response.code = result["Code"];
    response.errorInfo = result["ErrorInfo"];
    return response;
  }

  static Future<Response> logout() async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('logout');
    Response response = new Response();
    response.code = result["Code"];
    response.errorInfo = result["ErrorInfo"];
    return response;
  }

  static Response _parseResponseMessage(Map<dynamic, dynamic> result) {
    Response response = new Response();
    response.code = result["Code"];
    response.errorCode = result["ErrorCode"];
    response.errorInfo = result["ErrorInfo"];
    switch (response.code) {
      case 0:
        response.result = Message.fromJson(result["Message"]);
        break;
      default:
        response.result = result["Message"];
    }
    return response;
  }

  static Stream<Response> sendMessage(Message message) {
    Map<String, dynamic> arguments = message.toMap();
    arguments.putIfAbsent("method", () => "sendMessage");
    Stream<Response> _onMessageCallback;
    if (_onMessageCallback == null) {
      _onMessageCallback = _channel_event
          .receiveBroadcastStream(arguments)
          .map((event) => _parseResponseMessage(event));
    }
    return _onMessageCallback;
  }

  static Stream<Response> sendLocationMessage(Message message) {
    Map<String, dynamic> arguments = message.toMap();
    arguments.putIfAbsent("method", () => "sendLocationMessage");
    Stream<Response> _onMessageCallback;
    if (_onMessageCallback == null) {
      _onMessageCallback = _channel_event
          .receiveBroadcastStream(arguments)
          .map((dynamic event) => _parseResponseMessage(event));
    }
    return _onMessageCallback;
  }

  static Stream<Response> sendImageMessage(Message message) {
    Map<String, dynamic> arguments = message.toMap();
    arguments.putIfAbsent("method", () => "sendImageMessage");
    Stream<Response> _onMessageCallback;
    if (_onMessageCallback == null) {
      _onMessageCallback = _channel_event
          .receiveBroadcastStream(arguments)
          .map((dynamic event) => _parseResponseMessage(event));
    }
    return _onMessageCallback;
  }

  static Stream<Response> sendMediaMessage(Message message) {
    Map<String, dynamic> arguments = message.toMap();
    arguments.putIfAbsent("method", () => "sendMediaMessage");
    Stream<Response> _onMessageCallback;
    if (_onMessageCallback == null) {
      _onMessageCallback = _channel_event
          .receiveBroadcastStream(arguments)
          .map((dynamic event) => _parseResponseMessage(event));
    }
    return _onMessageCallback;
  }

  static Future<Response> clearMessages() async {
    final Map<dynamic, dynamic> result =
        await _channel.invokeMethod('clearMessages');
    Response response = new Response();
    response.code = result["Code"];
    response.errorInfo = result["ErrorInfo"];
    return response;
  }
}
