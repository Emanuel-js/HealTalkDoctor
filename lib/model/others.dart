class Other {
  final String acceptedDoctorID;
  final String patientId;
  final bool isclear;

  Other({
    this.acceptedDoctorID,
    this.patientId,
    this.isclear,
  });

  static fromJson(Map<String, dynamic> json) => Other(
        acceptedDoctorID: json["acceptedDoctorID"],
        patientId: json['patientId'],
        isclear: json['isclear'],
      );

  Map<String, dynamic> toJson() => {
        'acceptedDoctorID': acceptedDoctorID,
        'patientId': patientId,
        'isclear': isclear,
      };
}
