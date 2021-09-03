import 'package:heal_talk_doctor/index.dart';

// class PageInfoField {
//   static final String createdAt = 'createdAt';
// }

class PageInfo {
  final DateTime timestamps;
  final int progress;
  final String ownerId;
  final bool isrejected;
  final bool isaccepted;

  PageInfo(
      {this.timestamps,
      this.progress,
      this.ownerId,
      this.isrejected,
      this.isaccepted});

  static PageInfo fromJson(Map<String, dynamic> json) => PageInfo(
      timestamps: Utils.toDateTime(json['timestamps']),
      progress: json["progress"],
      ownerId: json["ownerId"],
      isrejected: json["isrejected"],
      isaccepted: json["isaccepted"]);

  Map<String, dynamic> toJson() => {
        'timestamps': Utils.fromDateTimeToJson(timestamps),
        'progress': progress,
        'ownerId': ownerId,
        'isrejected': isrejected,
        'isaccepted': isaccepted,
      };
}
