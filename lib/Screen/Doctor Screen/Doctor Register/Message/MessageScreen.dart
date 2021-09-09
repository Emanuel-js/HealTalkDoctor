import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:heal_talk_doctor/index.dart';

class ChatPage extends StatefulWidget {
  final Patient patient;
  final isaccepted;
  const ChatPage({
    @required this.patient,
    this.isaccepted,
    Key key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final colors = Appcolor();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<Doctor>(context);
    String url;
    if (doctor != null) {
      url = doctor.img;
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colors.black,
        leading: Container(
          child: IconButton(
            color: colors.primarypurpleColor,
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        elevation: 0,
        actions: [
          Container(
            child: Hero(
              tag: "${widget.patient.pId}",
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(widget.patient?.picture),
              ),
            ),
          ),
          PopupMenuButton<Menus>(
            onSelected: (Menus result) {
              // setState(() {
              //   _selection = result;
              // });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menus>>[
              PopupMenuItem<Menus>(
                value: Menus.note,
                child: Container(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context,
                        createRoute(DisplayNote(patient: widget.patient))),
                    child: Text('Take Note'),
                  ),
                ),
              ),
              PopupMenuItem<Menus>(
                value: Menus.schedule,
                child: Container(
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.push(context, createRoute(PatientSchedule())),
                    child: Text('schedule'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ProfileHeaderWidget(name: widget.user.firstName),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                color: colors.white,
                child: MessagesWidget(
                  idUser: widget.patient.pId,
                  ownerId: _auth.currentUser.uid,
                ),
              ),
            ),
            NewMessageWidget(
                ownerId: _auth.currentUser.uid,
                idUser: widget.patient.pId,
                avaterUrl: url)
          ],
        ),
      ),
    );
  }

  Widget endSessions() {
    return Container(child: showAlertDialog(context));
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    final colors = Appcolor();
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: colors.primarygreenColor,
      // contentPadding: EdgeInsets.all(30),
      actionsPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text("Are you sure ?",
          style: header2(
            color: colors.white,
          )),
      content: Text("End Session",
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
            // RequestApi().updateRequest(false, id);
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

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final info = Provider.of<Other>(context);

    return Scaffold(
      body: SafeArea(
          child: StreamBuilder<List<Patient>>(
        stream: PatientApi().getlistofPatinet(info?.patientId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text("Something Went Wrong Try later"));
              } else {
                final users = snapshot.data;

                if (!snapshot.hasData) {
                  return Text("No Users Found");
                } else
                  return Column(
                    children: [ChatBodyWidget(users: users)],
                  );
              }
          }
        },
      )
          // : CustomProgress().progress(),
          ),
    );
  }
}

enum Menus { schedule, note, end_sessions }
