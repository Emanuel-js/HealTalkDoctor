import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heal_talk_doctor/index.dart';

class Note {
  final String note;

  DateTime createdDate;
  final String noteTakerId;
  final String noteOwnerId;

  Note({this.note, this.noteTakerId, this.noteOwnerId, this.createdDate});

  static fromJson(Map<String, dynamic> json) => Note(
        createdDate: Utils.toDateTime(json['createdDate']),
        noteTakerId: json["noteTakerId"],
        noteOwnerId: json["noteOwnerId"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        'createdDate': Utils.fromDateTimeToJson(createdDate),
        'noteOwnerId': noteOwnerId,
        'noteTakerId': noteTakerId,
        'note': note
      };
}
