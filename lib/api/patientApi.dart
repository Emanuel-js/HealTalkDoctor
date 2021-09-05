import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heal_talk_doctor/index.dart';

class PatientApi {
  final _auth = FirebaseAuth.instance;
  static final CollectionReference patientCollection =
      FirebaseFirestore.instance.collection('Patient');

  Patient _getSinglePatient(DocumentSnapshot snapshot) {
    print("get list.........");
    print(snapshot.data());
    return Patient().fromJson(snapshot.data());
  }

  Stream<Patient> patientlist(id) =>
      patientCollection.doc(id).snapshots().map(_getSinglePatient);

  Stream<Patient> get patient => patientCollection
      .doc(_auth.currentUser.uid)
      .snapshots()
      .map(_getSinglePatient);

  List<Patient> _getlistOfPatient(QuerySnapshot snapshot) {
    return snapshot.docs.map((json) {
      return Patient(
        pId: json["pId"],
        firstName: json['firstName'],
        lastName: json["lastName"],
        age: json["age"],
        email: json["email"],
        gender: json["gender"],
        picture: json["picture"],
        isanonymous: json["isanonymous"],
        createdDate: Utils.toDateTime(json['createdDate']),
      );
    }).toList();
  }

  Stream<List<Patient>> getlistofPatinet(String sender) => patientCollection
      .where('pId', isEqualTo: sender)
      .snapshots()
      .map(_getlistOfPatient);

  Stream<List<Patient>> getptentbyId(senderList) {
    List data = [];
    return senderList.forEach((element) {
      print(".....for....");
      print(element["senderID"]);
      return patientCollection
          .doc(element["senderID"])
          .get()
          .then((DocumentSnapshot json) {
        if (json.exists) {
          data.add(json.data());
          data
              .map((e) => Patient(
                    pId: e["pId"],
                    firstName: e['firstName'],
                    lastName: e["lastName"],
                    age: e["age"],
                    email: e["email"],
                    gender: e["gender"],
                    picture: e["picture"],
                    isanonymous: e["isanonymous"],
                    createdDate: Utils.toDateTime(e['createdDate']),
                  ))
              .toList();
        }
      });
    });
  }
}
