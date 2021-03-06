import 'package:heal_talk_doctor/index.dart';

class PatientField {
  static final String lastMessageTime = 'createdDate';
}

class Patient {
  final String email;
  final String firstName;
  final int age;
  final String lastName;
  final String gender;
  final bool isanonymous;
  final String picture;
  final DateTime createdDate;
  final String pId;
  Patient(
      {this.pId,
      this.email,
      this.firstName,
      this.age,
      this.lastName,
      this.gender,
      this.isanonymous,
      this.picture,
      this.createdDate});

  fromJson(Map<String, dynamic> json) => Patient(
        pId: json["pId"],
        firstName: json['firstName'],
        lastName: json["lastName"],
        age: json["age"],
        email: json["email"],
        gender: json["gender"],
        picture: json["picture"],
        isanonymous: json["isanonymous"],
        createdDate: Utils.toDateTime(json['createdDate']),
      );

  Map<String, dynamic> toJson() => {
        "pId": pId,
        "email": email,
        'firstName': firstName,
        "age": age,
        "lastName": lastName,
        "gender": gender,
        "isanonymous": isanonymous,
        "picture": picture,
        'createdDate': Utils.fromDateTimeToJson(createdDate),
      };
}
