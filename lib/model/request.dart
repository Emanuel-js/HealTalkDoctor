import 'package:heal_talk_doctor/index.dart';

class RequestField {
  static final String createdAt = 'timestamps';
}

class Request {
  final DateTime timestamps;
  final bool state;
  final String requtSender;
  final String reqReciverId;
  final bool isaccepted;

  Request(
      {this.timestamps,
      this.state,
      this.requtSender,
      this.reqReciverId,
      this.isaccepted});

  Request fromJson(Map<String, dynamic> json) => Request(
      timestamps: Utils.toDateTime(json['timestamps']),
      state: json["state"],
      requtSender: json["requtSender"],
      reqReciverId: json["reqReciverId"],
      isaccepted: json["isaccepted"]);

  Map<String, dynamic> toJson() => {
        'timestamps': Utils.fromDateTimeToJson(timestamps),
        'state': state,
        'requtSender': requtSender,
        'reqReciverId': reqReciverId,
        'isaccepted': isaccepted,
      };
}
