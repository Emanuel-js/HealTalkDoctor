import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heal_talk_doctor/index.dart';

class NewMessageWidget extends StatefulWidget {
  final String ownerId;
  final String idUser;

  const NewMessageWidget({
    @required this.ownerId,
    @required this.idUser,
    Key key,
  }) : super(key: key);

  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _controller = TextEditingController();
  String message = '';

  void sendMessage() async {
    FocusScope.of(context).unfocus();
    print("....owner........");
    print(widget.ownerId);
    print("............");
    print("....user........");
    print(widget.idUser);
    print("............");
    await MessageApi()
        .uploadMessage(widget.idUser, widget.ownerId, message, "m", "");
    print("message is send!");
    _controller.clear();
  }

  final colors = Appcolor();
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _controller,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  labelText: 'Type your message',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0),
                    gapPadding: 10,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onChanged: (value) => setState(() {
                  message = value;
                }),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: _controller.text.trim().isEmpty ? null : sendMessage,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green[900],
                ),
                child: Icon(Icons.send, color: Colors.white),
              ),
            ),
          ],
        ),
      );
}
