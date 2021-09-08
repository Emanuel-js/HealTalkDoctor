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

  Future updatePateintRequest(List rm) async {
    Map data = {'requtSender': FieldValue.arrayRemove(rm)};

    await doctorCollection.doc(_auth.currentUser.uid).update(data);
  }

  Future activeDoctor(String id) async {
    await doctorCollection.doc(id).update({'isactive': true});
  }

  Future updateEducationalInfo(String expriance, String focus, String detail,
      String cv, String licence) async {
    Map<String, dynamic> data = <String, dynamic>{
      "expriance": expriance,
      "focus": focus,
      "detail": detail,
      "cv": cv,
      "licence": licence,
      "isactive": false,
      "requtSender": [],
      "rate": [0]
    };
    RequestApi().addNewClinte();
    await doctorCollection.doc(_auth.currentUser.uid).update(data);
  }

  Future updateRequests(bool isaccepted) async {
    Map<String, dynamic> data = <String, dynamic>{"isaccepted": isaccepted};

    await doctorCollection.doc(_auth.currentUser.uid).update({
      'requtSender': FieldValue.arrayUnion([
        {
          "isaccepted": isaccepted,
        }
      ])
    });
  }

  Future dletesreq(elements) async {
    await doctorCollection
        .doc(_auth.currentUser.uid)
        .update({'requtSender': FieldValue.arrayRemove(elements)});
  }

  Doctor _getdoctor(DocumentSnapshot doc) {
    // print(Utils.toDateTime(doc["createdDate"]));
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

  List<Doctor> _getDoctor(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
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
    }).toList();
  }

  Stream<List<Doctor>> get getdoctor =>
      doctorCollection.snapshots().map(_getDoctor);

  Stream<Doctor> get doctor =>
      doctorCollection.doc(_auth.currentUser.uid).snapshots().map(_getdoctor);

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
