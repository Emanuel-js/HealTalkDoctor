import 'package:heal_talk_doctor/index.dart';

class MessageField {
  static final String createdAt = 'createdAt';
}

class Message {
  final String ownerId;
  final String uId;
  final String urlAvatar;
  final String name;
  final String message;
  final DateTime createdAt;

  Message({
    this.ownerId,
    this.uId,
    this.urlAvatar,
    this.name,
    this.message,
    this.createdAt,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
      ownerId: json["ownerId"],
      uId: json['uId'],
      urlAvatar: json['urlAvatar'],
      name: json['name'],
      message: json['message'],
      createdAt: Utils.toDateTime(json['createdAt']));

  Map<String, dynamic> toJson() => {
        'ownerId': ownerId,
        'uId': uId,
        'urlAvatar': urlAvatar,
        'name': name,
        'message': message,
        'createdAt': Utils.fromDateTimeToJson(createdAt),
      };
}
