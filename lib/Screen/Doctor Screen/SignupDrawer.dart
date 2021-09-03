import 'package:heal_talk_doctor/index.dart';

class SignUpDrawer extends StatelessWidget {
  final colors = Appcolor();
  int coutprogrss = 0;
  int endprogress = 4;
  bool iscomleted = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 99,
      child: Container(
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
                    color: iscomleted
                        ? colors.primarypurpleColor
                        : colors.greydark,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Label1(
                    text: 'Personal Information',
                    fontsize: 18.0,
                    color: iscomleted
                        ? colors.primarypurpleColor
                        : colors.greydark,
                    fontweight: FontWeight.bold,
                  ),
                ],
              ),
              onTap: () {
                coutprogrss = 1;
                Navigator.push(context, createRoute(personal_info()));
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.school_sharp,
                    color: iscomleted
                        ? colors.primarypurpleColor
                        : colors.greydark,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Label1(
                    text: 'Educational Information',
                    fontsize: 18.0,
                    color: iscomleted
                        ? colors.primarypurpleColor
                        : colors.greydark,
                    fontweight: FontWeight.bold,
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => EducationalInfo()));
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.contact_page,
                    color: iscomleted
                        ? colors.primarypurpleColor
                        : colors.greydark,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Label1(
                    text: 'Sign Contract',
                    fontsize: 18.0,
                    color: iscomleted
                        ? colors.primarypurpleColor
                        : colors.greydark,
                    fontweight: FontWeight.bold,
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Signcontract()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
