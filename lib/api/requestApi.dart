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
    };
    await refRequests.doc(senderId).update(data).whenComplete(() => DisplayMsg()
        .displayMessage(msg: "You request is Updated", context: context));
  }

  List<Request> _getrequest(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) => Request().fromJson(e.data())).toList();
  }

  Stream<List<Request>> request(String id) =>
      refRequests.snapshots().map(_getrequest);
}
