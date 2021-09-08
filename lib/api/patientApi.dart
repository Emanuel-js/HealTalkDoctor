import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heal_talk_doctor/index.dart';
import 'package:provider/provider.dart';

class PatientApi {
  final _auth = FirebaseAuth.instance;
  static final CollectionReference patientCollection =
      FirebaseFirestore.instance.collection('Patient');

  Patient _getSinglePatient(DocumentSnapshot snapshot) {
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
  Stream<List<Patient>> get getallPatinet => patientCollection
      .orderBy('createdDate')
      .snapshots()
      .map(_getlistOfPatient);

  //get a list of requested patient

  // Future<List<Patient>> fetchAllMembers(List membersIDS) async {
  //   /// With whereIn
  //   var result =
  //       await patientCollection.where('pId', whereIn: membersIDS).get();
  //   var documents =
  //       result.docs.map((doc) => Patient().fromJson(doc.data())).toList();

  //   print(documents);
  //   return documents;
  // }

  Stream<Patient> getptentbyId(requtSender) {
    return requtSender.forEach((element) {
      return patientCollection
          .doc(element["senderID"])
          .snapshots()
          .map(_getSinglePatient);
    });
  }
}
