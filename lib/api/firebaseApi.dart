import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:path/path.dart';
import 'package:heal_talk_doctor/index.dart';

class FirebaseApi {
  final _auth = FirebaseAuth.instance;
  // static final CollectionReference patientCollection =
  //     FirebaseFirestore.instance.collection('Patient');

  static final CollectionReference doctorCollection =
      FirebaseFirestore.instance.collection('Doctor');

  Future addDoctor(String email, String fullname, String id) async {
    final newDoctor = Doctor(
      fullName: fullname,
      email: email,
      dId: id,
      createdDate: DateTime.now(),
    );

    await doctorCollection.doc(id).set(newDoctor.toJson());
  }

  Future updatePersonalInfo(String gender, DateTime dob, String img,
      String address, String phone, String nameTitle) async {
    Map<String, dynamic> data = <String, dynamic>{
      "gender": gender,
      "img": img,
      "dob": dob,
      "address": address,
      "phone": phone,
      "nameTitle": nameTitle,
    };
    await doctorCollection.doc(_auth.currentUser.uid).update(data);
  }

  Future updateEducationalInfo(String expriance, String focus, String detail,
      String cv, String licence) async {
    Map<String, dynamic> data = <String, dynamic>{
      "expriance": expriance,
      "focus": focus,
      "detail": detail,
      "cv": cv,
      "licence": licence,
      "requtSender": []
    };
    await doctorCollection.doc(_auth.currentUser.uid).update(data);
  }

  Doctor _getdoctor(DocumentSnapshot doc) {
    print(Utils.toDateTime(doc["createdDate"]));
    return Doctor(
        fullName: doc["fullName"],
        gender: doc["gender"],
        expriance: doc["expriance"],
        rate: doc["rate"],
        focus: doc["focus"],
        detail: doc["detail"],
        img: doc["img"],
        dId: doc["dId"],
        cv: doc["cv"],
        email: doc["email"],
        licence: doc["licence"],
        address: doc["address"],
        phone: doc["phone"],
        nameTitle: doc["nameTitle"],
        isactive: doc["isactive"],
        dob: Utils.toDateTime(doc["dob"]),
        requtSender: doc["requtSender"],
        createdDate: Utils.toDateTime(doc['createdDate']));
  }

  Stream<Doctor> get doctor =>
      doctorCollection.doc(_auth.currentUser.uid).snapshots().map(_getdoctor);

//   List<Message> _getmessagemap(QuerySnapshot snapshot) {
//     return snapshot.docs.map((doc) {
//       // print(doc);
//       return Message(
//         ownerId: doc["ownerId"],
//         uId: doc['uId'],
//         urlAvatar: doc['urlAvatar'],
//         name: doc['name'],
//         message: doc['message'],
//         createdAt: Utils.toDateTime(doc['createdAt']),
//       );
//     }).toList();
//   }

//  Stream<List<>> getmessags(String id, String uId) =>
//       FirebaseFirestore.instance
//           .collection('chats/${_auth.currentUser.uid}/messages')
//           // .where("ownerId", isEqualTo: id)
//           // .where("uId", isEqualTo: uId)
//           .orderBy(MessageField.createdAt, descending: true)
//           .snapshots()
//           .map(_getmessagemap);

//
  Future uploadFile(_file) async {
    String fileName = basename(_file.path);
    File file = File(_file.path);
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('uploads/$fileName')
          .putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e.message);
      // e.g, e.code == 'canceled'
    }
  }

  Future<String> downloadFile(filePath) async {
    String url;
    try {
      url = await firebase_storage.FirebaseStorage.instance
          .ref('uploads/$filePath')
          .getDownloadURL();
    } on firebase_core.FirebaseException catch (e) {
      print(e.code);
    }
    return url;
  }
}
