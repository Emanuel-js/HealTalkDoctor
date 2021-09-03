import 'dart:math';

import 'package:heal_talk_doctor/index.dart';

class DoctorHomePage extends StatefulWidget {
  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  final colors = Appcolor();

  @override
  Widget build(BuildContext context) {
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
                            doctor_notification()));
              }),
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
                    display: '3',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Homedoctorcontainer(
                    text: 'Treated Clients',
                    color: colors.lightblue,
                    display: '7',
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
                    display: '4.5',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Homedoctorcontainer(
                    text: 'Treated Clients',
                    color: colors.darkblue,
                    display: '10',
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  doctorchatmenu_Page()));
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  btnCustom(
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
                        image: AssetImage('assets/images/DoctorLogo.png'),
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
            text: display,
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

class doctor_notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        title: Label1(text: 'Notifications', color: colors.black),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [],
        ),
      ),
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
