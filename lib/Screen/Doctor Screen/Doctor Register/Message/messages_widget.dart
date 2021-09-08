import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heal_talk_doctor/index.dart';

class MessagesWidget extends StatelessWidget {
  final String idUser;
  final String ownerId;

  const MessagesWidget({
    @required this.idUser,
    @required this.ownerId,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    return StreamBuilder<List<Message>>(
        stream: MessageApi().getmessags(idUser, ownerId),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  "say Hi!",
                  style: header1(),
                ),
              ),
            );
          final ownerMsg = snapshot.data;

          return ListView.builder(
            physics: BouncingScrollPhysics(),
            reverse: true,
            itemCount: ownerMsg.length,
            itemBuilder: (context, index) {
              final ownerMsgs = ownerMsg[index];

              return MessageWidget(
                // ownermessage: ownerMsgs,
                message: ownerMsgs,
                isMe: ownerMsgs.ownerId == ownerId,
              );
            },
          );
        });
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );
}
