import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heal_talk_doctor/index.dart';

class PatientApi {
  final _auth = FirebaseAuth.instance;
  static final CollectionReference patientCollection =
      FirebaseFirestore.instance.collection('Patient');

  Patient _getSinglePatient(DocumentSnapshot snapshot) {
    return Patient().fromJson(snapshot.data());
  }

  Stream<Patient> get patient => patientCollection
      .doc(_auth.currentUser.uid)
      .snapshots()
      .map(_getSinglePatient);

  List<Patient> _getlistOfPatient(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      print(".....");
      print(e.data());
      print(".....");
      return Patient().fromJson(e.data());
    }).toList();
  }

  Stream<List<Patient>> getlistofPatinet(String sender) => patientCollection
      .where("pId", isEqualTo: sender)
      .snapshots()
      .map(_getlistOfPatient);
}
