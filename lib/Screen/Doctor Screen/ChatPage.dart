import 'package:flutter/cupertino.dart';
import 'package:heal_talk_doctor/index.dart';

// Chat Page for doctor
class chat_page extends StatelessWidget {
  String Name;
  String Status;
  String dr_Address;
  String dr_Phone;
  String img;
  int patient_id;
  chat_page(
      {this.Name,
      this.Status,
      this.img,
      this.patient_id,
      this.dr_Address,
      this.dr_Phone});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.white,
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(context, createRoute(doctorchatmenu_Page()));
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(img),
                  radius: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        Name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        Status,
                        style: TextStyle(
                            color: (Status == "Online")
                                ? colors.primarygreenColor
                                : colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.note,
                color: (Status == "Online")
                    ? colors.primarygreenColor
                    : colors.greydark,
              ),
              onPressed: () {
                showPrescriptionDialog(
                    context, "Dr. Amanuel", "CMC Summit", "+2519453121");
              }),

          //Chat setting
          PopupMenuButton(
            child: Center(
                child: Icon(
              Icons.more_vert,
              color: colors.black,
            )),
            itemBuilder: (context) {
              return List.generate(1, (index) {
                return PopupMenuItem(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlatButton(
                          child: Text('Patient Record'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                createRoute(display_note(
                                  name: Name,
                                )));
                          }),
                      FlatButton(
                        child: Text('Schedule'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context1) =>
                                      PatientSchedule()));
                        },
                      ),
                      FlatButton(
                        child: Text('End Session'),
                        onPressed: () {
                          showEndSession(context, Name);
                        },
                      ),
                    ],
                  ),
                );
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: (messages[index].messageType == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Column(
                          crossAxisAlignment:
                              (messages[index].messageType == "receiver"
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end),
                          children: [
                            GestureDetector(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      (messages[index].messageType == "receiver"
                                          ? colors.bkColor
                                          : colors.grey),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  messages[index].messageContent,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              onLongPress: () {
                                showMessageSetting(
                                    context, messages[index].messageContent);
                              },
                            ),
                            Label1(
                              text: '  10:34 AM  ',
                              color: colors.greydark,
                              fontsize: 12.0,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.photo_camera_back,
                          color: colors.greydark,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.attach_file,
                          color: colors.greydark,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: colors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.send_outlined,
                        color: colors.darkblue,
                        size: 25,
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showEndSession(BuildContext context, String Name) {
  Widget EndSession = FlatButton(
    onPressed: () {},
    child: Label1(
      text: "End Session",
      color: colors.redColor,
    ),
  );
  Widget Cancel = FlatButton(
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
    child: Label1(
      text: "Cancel",
      color: colors.black,
    ),
  );
  AlertDialog alert = new AlertDialog(
    title: Text("Warning"),
    content: Container(
      width: MediaQuery.of(context).size.width,
      child:
          Text("Are you sure you want to end your session with " + Name + "?"),
    ),
    actions: [
      EndSession,
      Cancel,
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext) {
        return alert;
      });
}

showMessageSetting(BuildContext context, String message) {
  // set up the button
  Widget EditButton = FlatButton(
    child: Text("Edit"),
    onPressed: () {},
  );
  Widget CancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {},
  );
  Widget DeleteButton = FlatButton(
    child: Text(
      "Delete",
      style: TextStyle(color: colors.redColor),
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
          initialValue: message,
          decoration: InputDecoration(
            border: InputBorder.none,
          )),
    ),
    actions: [
      EditButton,
      DeleteButton,
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
