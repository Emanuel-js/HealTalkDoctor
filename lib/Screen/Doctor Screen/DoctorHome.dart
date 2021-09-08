import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heal_talk_doctor/index.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DoctorHomePage extends StatefulWidget {
  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  final colors = Appcolor();

  @override
  Widget build(BuildContext context) {
    String id;
    final data = Provider.of<Doctor>(context);
    double sum = 0;
    double rate = 0;
    data?.rate?.forEach((element) {
      setState(() {
        sum += element;
        rate = (sum) / (data?.rate?.length + 5);
      });
    });
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colors.primarygreenColor),
        elevation: 0,
        backgroundColor: colors.bkColor,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: colors.darkblue,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DoctorNotification()));
              })
        ],
      ),
      drawer: drawer(),
      backgroundColor: colors.bkColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Label1(
                text: 'Tracking My Activity',
                color: colors.black,
                fontsize: 20.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Homedoctorcontainer(
                    text: 'Active Clients',
                    color: colors.secondarypurpleColor,
                    display: '0',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Homedoctorcontainer(
                    text: 'Treated Clients',
                    color: colors.lightblue,
                    display: '0',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Homedoctorcontainer(
                    text: 'Rating',
                    color: colors.primarygreenColor,
                    display: double.parse((rate).toStringAsFixed(1)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Homedoctorcontainer(
                    text: 'Treated Clients',
                    color: colors.darkblue,
                    display: '0',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btnCustom(
                    text: 'Chat',
                    textcolor: colors.white,
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.35,
                    color: colors.secondarypurpleColor,
                    onpress: () {
                      //Todo
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MessageScreen()));
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  btnCustom(
                    onpress: () {
                      Navigator.push(context, createRoute(PatientSchedule()));
                    },
                    text: 'Schedule',
                    textcolor: colors.white,
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.35,
                    color: colors.secondarypurpleColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Drawer for Doctor
class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Doctor>(context);

    return Container(
      padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height,
      color: colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image(
                        image: NetworkImage(data?.img),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt_outlined),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data?.fullName?.toUpperCase(),
                      style: header1(),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    DrawerRow(Icons.history_rounded, 'Session History'),
                    SizedBox(
                      height: 20,
                    ),
                    DrawerRow(Icons.feedback, 'Send Feedback'),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  child: DrawerRow(Icons.login_rounded, 'Logout'),
                  onTap: () {
                    AuthControlle().logout();
                    Navigator.push(context, createRoute(LoginPage()));
                  },
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Label1(text: 'Version 1.0'),
                    btnCustom(
                      text: 'About',
                      onpress: () {},
                      textcolor: colors.primarygreenColor,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Container for home screen
class Homedoctorcontainer extends StatelessWidget {
  final text;
  final display;
  final color;
  Homedoctorcontainer({this.text, this.display, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Label1(
            text: "$display",
            color: colors.white,
            fontsize: 40.0,
          ),
          Label1(
            text: text,
            color: colors.white,
          ),
        ],
      ),
    );
  }
}

//////////////View Notification

class DoctorNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<Doctor>(context);
    String id;
    int index;

    List<dynamic> reqList = [];

    if (doctor != null) {
      // print(doctor.requtSender);
      doctor.requtSender.forEach((element) {
        // // element.value.toList();
        id = element["senderID"];
        // print(element);
        reqList.add(element["senderID"]);
        // rm = element;
        // print(id);
        // FirebaseFirestore.instance
        //     .collection('Patient')
        //     .doc(element["senderID"])
        //     .get()
        //     .then((DocumentSnapshot doc) {
        //   if (doc.exists) {
        //     // id = doc["pId"];
        //   }
        // });
      });
      // final x = PatientApi()
      //     .fetchAllMembers(reqList)
      //     .then((value) => print("wowo...$value"));
      // print("..............");
      // print(PatientApi().fetchAllMembers(reqList));
      // print("..............");
    }

    return Scaffold(
        backgroundColor: colors.bkColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colors.bkColor,
          leading: btnBack(
            width: 40.0,
            height: 40.0,
            onpressed: () {
              Navigator.pop(context);
            },
          ),
          title: Label1(
            text: 'Notifications',
            color: colors.black,
          ),
          centerTitle: true,
        ),
        body: doctor != null
            ? ListView.builder(
                itemCount: doctor.requtSender.length,
                itemBuilder: (ctx, index) {
                  print(doctor.requtSender[index]["senderID"]);
                  return requestList(doctor.requtSender[index]["senderID"],
                      context, doctor.requtSender[index]);
                })
            : CustomProgress().progress());
  }

  Widget requestList(String id, context, isaccepted) {
    return StreamBuilder<Patient>(
      stream: PatientApi().patientlist(id),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData && isaccepted['isaccepted'] == false) {
          return Center(
              child: Text(
            "No Notification! 🍮",
            style: header1(),
          ));
        }

        final data = snapshot.data;
        return listAllRequest(data, context, isaccepted);
      },
    );
  }

  Widget listAllRequest(Patient patient, context, isaccepted) {
    return isaccepted["isaccepted"] == false
        ? Container(
            margin: EdgeInsets.only(top: 30, left: 10, right: 10),
            width: MediaQuery.of(context).size.width * 0.99,
            color: Color(0xFF72BF94),
            child: GestureDetector(
                onPanUpdate: (details) {
                  // Swiping in right direction.
                  if (details.delta.dx > 0) {
                    FirebaseApi().updateRequests(true);
                    RequestApi().updateRequest(true, patient.pId);
                    // print("right");
                    //Todo  navigot to message
                    RequestApi().updateClinte(true, patient.pId);
                    Navigator.pushReplacement(
                        context,
                        createRoute(ChatPage(
                            patient: patient, isaccepted: isaccepted)));
                  }

                  // Swiping in left direction.
                  if (details.delta.dx < 0) {
                    // RequestApi().updateRequest(false, patient.pId);
                    showAlertDialog(
                        context,
                        "Are you sure?",
                        "do you want cancel the request! 🏃‍♀️",
                        patient.pId,
                        isaccepted);
                    // print("left");
                  }
                },
                child: Card(
                  color: Color(0xFF72BF94),
                  elevation: 9,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: ListTile(
                    subtitle: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "do you want accept the request 🙋",
                        style:
                            TextStyle(color: colors.call_bk_blue, fontSize: 16),
                      ),
                    ),
                    contentPadding: EdgeInsets.only(top: 20, bottom: 20),
                    title: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: patient.isanonymous == false
                          ? Text(patient.firstName + " " + patient.lastName,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold))
                          : Text("anonymous"),
                    ),
                    trailing: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Icon(Icons.arrow_forward_ios_rounded)),
                    leading: patient.isanonymous == false
                        ? CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(patient?.picture, scale: 40),
                          )
                        : Container(
                            child: Text(
                            "😎",
                            style: header1(),
                          )),
                  ),
                )),
          )
        : Text("");
  }

  showAlertDialog(
      BuildContext context, String title, String disc, id, isaccepted) {
    // set up the buttons
    final colors = Appcolor();
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: colors.primarygreenColor,
      // contentPadding: EdgeInsets.all(30),
      actionsPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(title,
          style: header2(
            color: colors.white,
          )),
      content: Text(disc,
          style: body1(
            color: colors.white,
          )),
      actions: [
        Button1(
          text: "Cancel",
          color: Colors.red,
          onpress: () {
            Navigator.pop(context);
          },
        ),
        Button1(
          color: Colors.blueGrey,
          text: "Continue",
          onpress: () {
            RequestApi().updateRequest(false, id);
            // FirebaseApi().dletesreq(isaccepted);
            Navigator.pop(context);
            // FirebaseApi().updatePateintRequest(rm);
            //todo update doctor db
          },
        ),
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
}

Widget DrawerRow(final icon, String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(
        icon,
        color: colors.primarygreenColor,
      ),
      Label1(
        text: text,
        fontsize: 16.0,
        color: colors.greydark,
        fontweight: FontWeight.bold,
      ),
    ],
  );
}
