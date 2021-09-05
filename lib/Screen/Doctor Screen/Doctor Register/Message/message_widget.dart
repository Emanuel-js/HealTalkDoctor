import 'package:flutter/material.dart';
import 'package:heal_talk_doctor/index.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  final bool isMe;
  // final Message ownermessage;

  const MessageWidget({
    // @required this.ownermessage,
    @required this.message,
    @required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(12);
    final borderRadius = BorderRadius.all(radius);
    String time = DateFormat.jm().format(message.createdAt);

    // print(Utils.fromDateTimeToJson(message.createdAt));
    return Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              if (!isMe)
                CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(message.urlAvatar)),
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(maxWidth: 140),
                decoration: BoxDecoration(
                  color:
                      isMe ? Colors.grey[100] : Theme.of(context).accentColor,
                  borderRadius: isMe
                      ? borderRadius
                          .subtract(BorderRadius.only(bottomRight: radius))
                      : borderRadius
                          .subtract(BorderRadius.only(bottomLeft: radius)),
                ),
                child: buildMessage(),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: Text(
                time,
              )),
        ]);
  }

  Widget buildMessage() {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            message.message,
            style: TextStyle(color: isMe ? Colors.black : Colors.white),
            textAlign: isMe ? TextAlign.end : TextAlign.start,
          ),
        ),
      ],
    );
  }
}
