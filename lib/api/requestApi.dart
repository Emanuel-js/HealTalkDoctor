import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heal_talk_doctor/index.dart';
import 'package:path/path.dart';

class RequestApi {
  final _auth = FirebaseAuth.instance;
  static final refRequests = FirebaseFirestore.instance.collection('Request');
  static final doctorCollection =
      FirebaseFirestore.instance.collection('Doctor');

  Future updateRequest(bool state, String senderId) async {
    Map<String, dynamic> data = <String, dynamic>{
      "isaccepted": state,
      "state": state,
    };
    await refRequests.doc(senderId).update(data).whenComplete(() => DisplayMsg()
        .displayMessage(msg: "You request is Updated", context: context));
  }

  List<Request> _getrequest(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) => Request().fromJson(e.data())).toList();
  }

  Stream<List<Request>> request(String id) =>
      refRequests.snapshots().map(_getrequest);

  ///otehrs
  ///
  ///
  static final refOthers = FirebaseFirestore.instance.collection('Others');

  Future sendOther(bool isclear, String acceptedDoctorID) async {
    final newOther = Other(
      acceptedDoctorID: acceptedDoctorID,
      patientId: _auth.currentUser.uid,
      isclear: isclear,
    );
    await refOthers.doc(_auth.currentUser.uid).set(newOther.toJson());
  }

  //get Other

  Other _getOther(DocumentSnapshot snapshot) {
    // print("Other");
    // print(snapshot);
    return Other(
      acceptedDoctorID: snapshot["acceptedDoctorID"],
      patientId: snapshot['patientId'],
      isclear: snapshot['isclear'],
    );
  }

  Stream<Other> get getOters =>
      refOthers.doc(_auth.currentUser.uid).snapshots().map(_getOther);
}
