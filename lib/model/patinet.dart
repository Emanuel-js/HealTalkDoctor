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
  final DateTime lastMessageTime;
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
      this.lastMessageTime});

  fromJson(Map<String, dynamic> json) => Patient(
        pId: json["pId"],
        firstName: json['FirstName'],
        lastName: json["LastName"],
        age: json["age"],
        email: json["email"],
        gender: json["gender"],
        picture: json["picture"],
        isanonymous: json["isanonymous"],
        lastMessageTime: Utils.toDateTime(json['lastMessageTime']),
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
        'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime),
      };
}
