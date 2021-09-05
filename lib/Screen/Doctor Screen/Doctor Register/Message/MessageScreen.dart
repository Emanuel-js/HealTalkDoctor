import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:heal_talk_doctor/index.dart';

class ChatPage extends StatefulWidget {
  final Patient patient;

  const ChatPage({
    @required this.patient,
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
    // final doctor = Provider.of<Doctor>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colors.bkColor,
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
              tag: "pro",
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(widget.patient?.picture),
              ),
            ),
          ),
          Container(
              child: IconButton(icon: Icon(Icons.phone), onPressed: () {})),
          PopupMenuButton<Menus>(
            onSelected: (Menus result) {
              // setState(() {
              //   _selection = result;
              // });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menus>>[
              PopupMenuItem<Menus>(
                value: Menus.schedule,
                child: Container(
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.push(context, createRoute(DoctorHomePage())),
                    child: Text('Schedule'),
                  ),
                ),
              ),
              PopupMenuItem<Menus>(
                value: Menus.detail,
                child: Text('Show Profile'),
              ),
              PopupMenuItem<Menus>(
                value: Menus.end_sessions,
                child: Text('End Sessions'),
              ),
              PopupMenuItem<Menus>(
                value: Menus.report,
                child: Text('Report'),
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
                ownerId: _auth.currentUser.uid, idUser: widget.patient.pId)
          ],
        ),
      ),
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

enum Menus { schedule, detail, end_sessions, report }
