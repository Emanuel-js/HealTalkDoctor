import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:heal_talk_doctor/index.dart';

class PageDataApi {
  final _auth = FirebaseAuth.instance;
  // static final CollectionReference patientCollection =
  //     FirebaseFirestore.instance.collection('Patient');

  static final CollectionReference pageInfoCollection =
      FirebaseFirestore.instance.collection('PageInfo');

  Future addPageInfo() async {
    final newPageinfo = PageInfo(
      progress: 0,
      isaccepted: false,
      ownerId: _auth.currentUser.uid,
      timestamps: DateTime.now(),
      isrejected: false,
    );

    await pageInfoCollection
        .doc(_auth.currentUser.uid)
        .set(newPageinfo.toJson());
  }

  Future updatePageInfo(int progress, bool isaccepted, bool isrejected) async {
    Map<String, dynamic> data = <String, dynamic>{
      "progress": progress,
      "isaccepted": isaccepted,
      "isrejected": isrejected,
    };

    await pageInfoCollection.doc(_auth.currentUser.uid).update(data);
  }

  PageInfo _getPageInfo(DocumentSnapshot snapshot) {
    return PageInfo(
      progress: snapshot["progress"],
      ownerId: snapshot["ownerId"],
      isrejected: snapshot["isrejected"],
      isaccepted: snapshot["isaccepted"],
      timestamps: Utils.toDateTime(snapshot["timestamps"]),
    );
  }

  Stream<PageInfo> get pageInfo => pageInfoCollection
      .doc(_auth.currentUser.uid)
      .snapshots()
      .map(_getPageInfo);
}
