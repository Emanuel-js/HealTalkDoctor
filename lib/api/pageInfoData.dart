import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  PageInfo _getPageInfo(DocumentSnapshot json) {
    return PageInfo(
        timestamps: Utils.toDateTime(json['timestamps']),
        progress: json["progress"],
        ownerId: json["ownerId"],
        isrejected: json["isrejected"],
        isaccepted: json["isaccepted"]);
  }

  Stream<PageInfo> get pageInfo => pageInfoCollection
      .doc(_auth.currentUser?.uid)
      .snapshots()
      .map(_getPageInfo);
  Stream<PageInfo> pageInfos(String id) => pageInfoCollection
      .doc(_auth.currentUser?.uid)
      .snapshots()
      .map(_getPageInfo);
}
