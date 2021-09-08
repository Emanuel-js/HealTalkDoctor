import 'package:heal_talk_doctor/index.dart';
import 'package:provider/provider.dart';

class SignUpDrawer extends StatefulWidget {
  @override
  _SignUpDrawerState createState() => _SignUpDrawerState();
}

class _SignUpDrawerState extends State<SignUpDrawer> {
  final colors = Appcolor();

  int coutprogrss = 0;

  int endprogress = 3;

  bool iscomleted = false;

  @override
  Widget build(BuildContext context) {
    final progress = Provider.of<Doctor>(context);
    if (progress != null) {
      setState(() {
        iscomleted = progress.isactive;
      });
    }

    return Drawer(
      elevation: 99,
      child: StreamBuilder<PageInfo>(
          stream: PageDataApi().pageInfo,
          builder: (ctx, snapshot) {
            if (!snapshot.hasData) return CustomProgress().progress();
            final data = snapshot.data;
            coutprogrss = data.progress;
            // iscomleted = data.isaccepted;
            return Container(
                child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Center(
                      child: Label1(
                    text: '$coutprogrss/$endprogress Completed',
                    fontsize: 30.0,
                    color: colors.primarygreenColor,
                  )),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.person_add_alt_1_rounded,
                        color: coutprogrss == 0
                            ? colors.primarypurpleColor
                            : colors.greydark,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Label1(
                        text: 'Personal Information',
                        fontsize: 18.0,
                        color: coutprogrss == 0
                            ? colors.primarypurpleColor
                            : colors.greydark,
                        fontweight: FontWeight.bold,
                      ),
                    ],
                  ),
                  onTap: () {
                    coutprogrss == 0
                        ? Navigator.push(context, createRoute(PersonalInfo()))
                        : DisplayMsg().displayMessage(
                            context: context,
                            msg: "you can't modifay your personal file now!");
                  },
                ),
                ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.school_sharp,
                          color: coutprogrss == 1
                              ? colors.primarypurpleColor
                              : colors.greydark,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Label1(
                          text: 'Educational Information',
                          fontsize: 18.0,
                          color: coutprogrss == 1
                              ? colors.primarypurpleColor
                              : colors.greydark,
                          fontweight: FontWeight.bold,
                        ),
                      ],
                    ),
                    onTap: () {
                      coutprogrss == 1
                          ? Navigator.push(
                              context, createRoute(EducationalInfo()))
                          : DisplayMsg().displayMessage(
                              context: context,
                              msg:
                                  "you can't modifay your Educational file now! 😞");
                    }),
                ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.contact_page,
                          color: coutprogrss == 2
                              ? colors.primarypurpleColor
                              : colors.greydark,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Label1(
                          text: 'Sign Contract',
                          fontsize: 18.0,
                          color: coutprogrss == 2
                              ? colors.primarypurpleColor
                              : colors.greydark,
                          fontweight: FontWeight.bold,
                        ),
                      ],
                    ),
                    onTap: () {
                      iscomleted
                          ? Navigator.push(context, createRoute(Signcontract()))
                          : messageType();
                    }),
                SizedBox(
                  height: 70,
                ),
                ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.logout, color: colors.greydark),
                        SizedBox(
                          width: 30,
                        ),
                        Label1(
                          text: 'LogOut',
                          fontsize: 18.0,
                          color: colors.greydark,
                        ),
                      ],
                    ),
                    onTap: () {
                      AuthControlle().logout().then((value) =>
                          Navigator.pushReplacement(
                              context, createRoute(mainpage())));
                    }),
              ],
            ));
          }),
    );
  }

  messageType() {
    if (coutprogrss < 2) {
      DisplayMsg().displayMessage(
          context: context,
          msg:
              "First You Have to add Your Personal and Educational Information! 😞");
    } else {
      // Navigator.push(context, createRoute(WaitScreen()));
      DisplayMsg().displayMessage(
          context: context,
          msg: "To be Sign a Contract First You have to be Accepted! 🧑");
    }
  }
}
