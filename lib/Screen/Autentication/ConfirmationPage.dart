import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:heal_talk_doctor/index.dart';

class Confirmationpage extends StatefulWidget {
  @override
  _ConfirmationpageState createState() => _ConfirmationpageState();
}

class _ConfirmationpageState extends State<Confirmationpage> {
  final auth = FirebaseAuth.instance;

  User user;
  Timer _timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailvef();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Scaffold(
      // appBar: backAppBar(context: context, color: colors.k_bkColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //title
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 20, right: MediaQuery.of(context).size.width * 0.4),
                child: Text(
                  "Confirm your   ",
                  style: header1(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 20, right: MediaQuery.of(context).size.width * 0.63),
                child: Text(
                  "Email",
                  style: header1(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),

              msg("The Verification link is sent to ${user.email}  please Verify your Email"),
              SizedBox(
                height: 30,
              ),
              CustomProgress().progress(rad: 30),
              SizedBox(
                height: 30,
              ),
              btnCustom(
                text: "Resend Varification",
                onpress: () {
                  user.sendEmailVerification();
                },
              )

//Todo card
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkEmailvef() async {
    user = auth.currentUser;
    await user.reload();
    print("pls varify");
    if (user.emailVerified) {
      _timer.cancel();
      Navigator.pushReplacement(context, createRoute(Welcomepage()));
    }
  }

  Widget msg(String msg) {
    final colors = Appcolor();
    return Container(
      padding: EdgeInsets.all(50),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: colors.primarypurpleColor,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        msg,
        style: TextStyle(
          color: colors.grey,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
