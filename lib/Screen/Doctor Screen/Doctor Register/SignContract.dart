import 'package:heal_talk_doctor/index.dart';

class Signcontract extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.bkColor,
        iconTheme: IconThemeData(color: colors.primarygreenColor),
      ),
      drawer: SignUpDrawer(),
      backgroundColor: colors.bkColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Label1(
              text: "Contract Review",
              fontsize: 25.0,
              color: colors.secondarypurpleColor,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colors.white,
            ),
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListViewLicense(),
          ),
          btnCustom(
              height: 40.0,
              color: colors.secondarypurpleColor,
              text: "Agree and Sign Contract",
              textcolor: colors.white,
              onpress: () {
                Navigator.push(context, createRoute(DoctorHomePage()));
              }),
          btnCustom(
            height: 40.0,
            color: colors.redColor,
            text: "Reject Contract",
            textcolor: colors.white,
          )
        ],
      )),
    );
  }
}
