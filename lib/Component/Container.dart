import 'dart:math';

import 'package:heal_talk_doctor/index.dart';

class container_doctor_detail extends StatelessWidget {
  String text;
  Icon icon;
  container_doctor_detail({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: colors.grey,
              blurRadius: 4,
            )
          ]),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(color: colors.black),
          )
        ],
      ),
    );
  }
}

//////////Alertdialog to block doctor
showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("Confirm"),
    onPressed: () {},
  );
  Widget cancelButton = FlatButton(
    child: Text(
      "Cancel",
      style: TextStyle(color: colors.redColor),
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Are you sure you want to block the doctor?"),
    content: Text("This action can't be reversed!"),
    actions: [
      okButton,
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class admin_message extends StatelessWidget {
  String text;
  admin_message({this.text});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label1(
                text: text,
                fontsize: 25.0,
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                color: colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showInputMessage(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("Send"),
    onPressed: () {},
  );
  Widget cancelButton = FlatButton(
    child: Text(
      "Cancel",
      style: TextStyle(color: colors.redColor),
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Message"),
    content: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Align(
          alignment: Alignment.topLeft,
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Compose message here...",
            ),
          ),
        ),
      ),
    ),
    actions: [
      okButton,
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}







showSaveNote(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("Save"),
    onPressed: () {},
  );
  Widget cancelButton = FlatButton(
    child: Text(
      "Cancel",
      style: TextStyle(color: colors.redColor),
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Note"),
    content: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Subject: ",
                ),
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Description: ",
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    actions: [
      okButton,
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



































