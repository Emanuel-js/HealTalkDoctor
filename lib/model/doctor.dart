import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heal_talk_doctor/index.dart';

class DoctorField {
  static final String createdDate = 'createdDate';
}

class Doctor {
  final String fullName;
  final String gender;
  final String expriance;
  final int rate;
  final String focus;
  final String detail;
  final String dId;
  final String img;
  final DateTime createdDate;
  final String cv;
  final bool isactive;
  final String email;
  final String licence;
  final String address;
  final String phone;
  final String nameTitle;
  final DateTime dob;
  final List requtSender;

  Doctor(
      {this.fullName,
      this.gender,
      this.expriance,
      this.rate,
      this.focus,
      this.detail,
      this.img,
      this.dId,
      this.cv,
      this.licence,
      this.createdDate,
      this.address,
      this.nameTitle,
      this.phone,
      this.dob,
      this.email,
      this.requtSender,
      this.isactive});

  fromJson(Map<String, dynamic> json) => Doctor(
      fullName: json["fullName"],
      gender: json["gender"],
      expriance: json["expriance"],
      rate: json["rate"],
      focus: json["focus"],
      detail: json["detail"],
      img: json["img"],
      dId: json["dId"],
      cv: json["cv"],
      email: json["email"],
      licence: json["licence"],
      address: json["address"],
      phone: json["phone"],
      nameTitle: json["nameTitle"],
      isactive: json["isactive"],
      dob: Utils.toDateTime(json["dob"]),
      requtSender: json["requtSender"],
      createdDate: Utils.toDateTime(json['createdDate']));

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "gender": gender,
        "expriance": expriance,
        "rate": rate,
        "focus": focus,
        "detail": detail,
        "img": img,
        "dId": dId,
        "dob": Utils.fromDateTimeToJson(dob),
        "cv": cv,
        "email": email,
        "licence": licence,
        "address": address,
        "phone": phone,
        "nameTitle": nameTitle,
        "requtSender": requtSender,
        "isactive": isactive,
        'createdDate': Utils.fromDateTimeToJson(createdDate),
      };
}
