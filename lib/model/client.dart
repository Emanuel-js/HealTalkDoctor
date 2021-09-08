import 'package:heal_talk_doctor/index.dart';
import 'package:heal_talk_doctor/model/patinet.dart';

class Client {
  final String clintId;
  final bool clinteState;
  final String serviceGiverId;
  final Patient patient;
  Client({this.clintId, this.clinteState, this.serviceGiverId, this.patient});

  static fromJson(Map<String, dynamic> json) => Client(
        clintId: json["clintId"],
        clinteState: json["clint"],
        patient: Patient().fromJson(json["patient"]),
        serviceGiverId: json["serviceGiverId"],
      );

  Map<String, dynamic> toJson() => {
        'clintId': clintId,
        'clinteState': clinteState,
        'serviceGiverId': serviceGiverId,
        'patient': patient.toJson(),
      };
}

class Schedule {
  DateTime schedule;
  String dics;
  String scheduleId;
  String type;
  Schedule({this.type, this.dics, this.scheduleId, this.schedule});

  static fromJson(Map<String, dynamic> json) => Schedule(
        schedule: Utils.toDateTime(json['schedule']),
        dics: json["dics"],
        scheduleId: json["scheduleId"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        'schedule': Utils.fromDateTimeToJson(schedule),
        'dics': dics,
        'scheduleId': scheduleId,
        'type': type
      };
}
