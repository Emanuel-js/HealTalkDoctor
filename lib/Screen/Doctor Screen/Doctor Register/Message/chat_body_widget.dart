import 'package:flutter/material.dart';
import 'package:heal_talk_doctor/index.dart';
import 'package:provider/provider.dart';

class ChatBodyWidget extends StatelessWidget {
  final List<Patient> users;

  const ChatBodyWidget({
    @required this.users,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final info = Provider.of<Request>(context);
    return Expanded(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: colors.primarygreenColor),
          elevation: 0,
          backgroundColor: colors.white,
          title: Label1(text: 'Chat List', color: colors.black),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.home_outlined,
              color: colors.primarygreenColor,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => DoctorHomePage()));

              //Navigator.push(context, createRoute(doctorhome_Page()));
            },
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: colors.greydark,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DoctorNotification()));
                }),
          ],
        ),
        drawer: drawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Container(
              child: Column(
                children: [buildChats(context)],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChats(context) {
    //final data = Provider.of<Doctor>(context);

    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: users?.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return Align(
            alignment: Alignment.center,
            child: Container(
              color: colors.bkColor,
              margin: EdgeInsets.only(top: 10),
              height: 75,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatPage(patient: user),
                  ));
                },
                leading: Hero(
                  tag: "${user.pId}",
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: user.isanonymous
                        ? NetworkImage("https://i.pravatar.cc/300")
                        : NetworkImage(user?.picture),
                  ),
                ),
                title:
                    user.isanonymous ? Text("anonymous") : Text(user.firstName),
              ),
            ),
          );
        },
      ),
    );
  }
}
