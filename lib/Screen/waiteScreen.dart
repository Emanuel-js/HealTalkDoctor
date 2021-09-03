import 'package:flutter/material.dart';
import 'package:heal_talk_doctor/index.dart';

class WaitScreen extends StatelessWidget {
  const WaitScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Scaffold(
      // appBar: backAppBar(context: context, color: colors.k_bkColor),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Text(
                "Wait until Our team ",
                style: header1(),
              ),
            ), //we come back soon
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(right: 18),
              child: Text("review your document", style: header1()),
            ),
            Container(
              margin: EdgeInsets.only(right: 30, top: 40),
              child: Text("We come back to you soon!", style: body2()),
            ),
            SizedBox(height: 50),
            Center(
              child: Image.asset(
                "assets/images/Brazuca.png",
                width: MediaQuery.of(context).size.height * 0.35,
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
