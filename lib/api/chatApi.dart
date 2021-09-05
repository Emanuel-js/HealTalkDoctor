import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heal_talk_doctor/index.dart';

class MessageApi {
  static final CollectionReference patientCollection =
      FirebaseFirestore.instance.collection('Patient');
  final _auth = FirebaseAuth.instance;
  Future uploadMessage(String uId, String ownerId, String message, String url,
      String name) async {
    final refMessages =
        FirebaseFirestore.instance.collection('chats/$uId/messages');

    final newMessage = Message(
      ownerId: ownerId,
      uId: uId,
      urlAvatar: url,
      name: name,
      message: message,
      createdAt: DateTime.now(),
    );
    await refMessages.doc(ownerId).collection("chat").add(newMessage.toJson());

    await patientCollection
        .doc(uId)
        .update({PatientField.lastMessageTime: DateTime.now()});
  }

  List<Message> _getmessagemap(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      // print(doc);
      return Message(
        ownerId: doc["ownerId"],
        uId: doc['uId'],
        urlAvatar: doc['urlAvatar'],
        name: doc['name'],
        message: doc['message'],
        createdAt: Utils.toDateTime(doc['createdAt']),
      );
    }).toList();
  }

  //  return Message(
  //     uId: snapshot['uId'],
  //     urlAvatar: snapshot['urlAvatar'],
  //     name: snapshot['name'],
  //     message: snapshot['message'],
  //     createdAt: Utils.toDateTime(snapshot['createdAt']),
  //   );

  Stream<List<Message>> getmessags(String pid, String did) =>
      FirebaseFirestore.instance
          .collection('chats/$did/messages/$pid/chat')
          // .where("ownerId", isEqualTo: id)
          // .where("uId", isEqualTo: uId)
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .map(_getmessagemap);

  Stream<List<Message>> getMessagesfromuser(String id) =>
      FirebaseFirestore.instance
          .collection('chats/$id/messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .map(_getmessagemap);
  // .transform(Utils.transformer(Message.fromJson));

}
