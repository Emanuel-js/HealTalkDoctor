class Report {
  final String report;
  final String senderId;
  DateTime createdDate;
  final String doctorId;
  Report({this.report, this.senderId, this.createdDate, this.doctorId});

  static fromJson(Map<String, dynamic> json) => Report(
      senderId: json["senderId"],
      report: json['report'],
      doctorId: json['doctorId'],
      createdDate: json['createdDate']);

  Map<String, dynamic> toJson() => {
        'senderId': senderId,
        'report': report,
        'createdDate': createdDate,
        'doctorId': doctorId
      };
}
