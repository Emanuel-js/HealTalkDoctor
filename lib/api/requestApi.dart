import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heal_talk_doctor/index.dart';
import 'package:path/path.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RequestApi {
  final _auth = FirebaseAuth.instance;
  static final refRequests = FirebaseFirestore.instance.collection('Request');
  static final doctorCollection =
      FirebaseFirestore.instance.collection('Doctor');
  static final clintCollction =
      FirebaseFirestore.instance.collection('Client ');
  static final scheduleCollction =
      FirebaseFirestore.instance.collection('Schedule');
  static final noteCollction = FirebaseFirestore.instance.collection('Note');
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
  // Stream<Request>> get request(String id) => refRequests.snapshots().map(_getrequest);

  ///otehr
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

  //get clinte

  Future addNewClinte() async {
    final newClinte = Client();
    await clintCollction
        .doc(_auth.currentUser.uid)
        .collection("clintes")
        .add(newClinte.toJson());
  }

  List<Client> _getclinet(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) => Client.fromJson(e.data())).toList();
  }

  Stream<List<Client>> clients(String id) =>
      clintCollction.snapshots().map(_getclinet);

  Future updateClinte(bool state, String clintId) async {
    Map<String, dynamic> data = <String, dynamic>{
      'clintId': clintId,
      'clinteState': state,
      'serviceGiverId': _auth.currentUser.uid,
    };

    await clintCollction.doc(_auth.currentUser.uid).update(data).whenComplete(
        () => DisplayMsg()
            .displayMessage(msg: "New clinte is added! 🚀", context: context));
  }

  //schedule

  Future addNewschedule(DateTime schedule, String disc, String type) async {
    final newClinte = Schedule(schedule: schedule, dics: disc, type: type);
    await scheduleCollction
        .doc(_auth.currentUser.uid)
        .collection("Schedule")
        .add(newClinte.toJson());
  }

  List<Schedule> _getshagule(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((json) => Schedule(
              schedule: Utils.toDateTime(json['schedule']),
              dics: json["dics"],
              scheduleId: json["scheduleId"],
              type: json["type"],
            ))
        .toList();
  }

  Stream<List<Schedule>> get schedule => scheduleCollction
      .doc(_auth.currentUser.uid)
      .collection("Schedule")
      .orderBy("type", descending: false)
      .snapshots()
      .map(_getshagule);

  Future updateSchagule(String type, String disc, DateTime schedule) async {
    Map<String, dynamic> data = <String, dynamic>{
      'schedule': schedule,
      'dics': disc,
      'type': type
    };

    await scheduleCollction
        .doc(_auth.currentUser.uid)
        .update(data)
        .whenComplete(() => DisplayMsg()
            .displayMessage(msg: "New clinte is added! 🚀", context: context));
  }

  Future removScagule(String id) async {
    scheduleCollction
        .doc(_auth.currentUser.uid)
        .collection("Schedule")
        .doc(id)
        .delete();
  }

  /////
  //Note or history
  Future addNewnote(String note, String pid) async {
    final newNote = Note(
      note: note,
      createdDate: DateTime.now(),
      noteOwnerId: pid,
      noteTakerId: _auth.currentUser.uid,
    );
    await noteCollction.doc(pid).collection("Note").add(newNote.toJson());
  }

  List<Note> _getnote(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((json) => Note(
              createdDate: Utils.toDateTime(json['createdDate']),
              noteTakerId: json["noteTakerId"],
              noteOwnerId: json["noteOwnerId"],
              note: json["note"],
            ))
        .toList();
  }

  Stream<List<Note>> notes(String id) => noteCollction
      .doc(id)
      .collection("Note")
      .orderBy("createdDate", descending: false)
      .snapshots()
      .map(_getnote);

  // Future updateNote(String type, String disc, DateTime schedule) async {
  //   Map<String, dynamic> data = <String, dynamic>{
  //     'schedule': schedule,
  //     'dics': disc,
  //     'type': type
  //   };

  //   await scheduleCollction
  //       .doc(_auth.currentUser.uid)
  //       .update(data)
  //       .whenComplete(() => DisplayMsg()
  //           .displayMessage(msg: "New clinte is added! 🚀", context: context));
  // }

  // Future removScagule(String id) async {
  //   scheduleCollction
  //       .doc(_auth.currentUser.uid)
  //       .collection("Schedule")
  //       .doc(id)
  //       .delete();
  // }
}
