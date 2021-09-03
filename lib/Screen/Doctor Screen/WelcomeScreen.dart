import 'dart:math';

import 'package:heal_talk_doctor/index.dart';

class Welcomepage extends StatefulWidget {
  @override
  _WelcomepageState createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primarygreenColor,
        elevation: 0,
      ),
      drawer: SignUpDrawer(),
      body: Container(
        color: colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100)),
                color: colors.primarygreenColor,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Label1(
                  text: "Welcome to HealTalkDoctor",
                  fontsize: 25.0,
                  color: colors.white,
                  fontstyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              color: colors.primarygreenColor,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(200),
                  ),
                  color: colors.white,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Label1(
                          text:
                              "Congratulatons! you have completed the first step towards being part of the HealTalk family. Please complete the requirements provided on the top left menu to use the app.\n\n\nThankyou for choosing us.",
                          color: colors.greydark,
                          fontsize: 19.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
