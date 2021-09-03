import 'package:heal_talk_doctor/index.dart';

class mainpage extends StatefulWidget {
  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  final colors = Appcolor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // margin: EdgeInsets.all(30),
            color: colors.bkColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(30),
                      child: RichText(
                        text: TextSpan(
                          text: 'Welcome to ',
                          style: TextStyle(
                              fontSize: 35,
                              color: colors.black,
                              fontWeight: FontWeight.bold),
                          children: const <TextSpan>[
                            TextSpan(
                                text: '#',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                            TextSpan(text: '1 Therapy App'),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0,
                  ),
                  Image(
                    image: AssetImage('assets/images/DoctorLogo.png'),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  // Button for register
                  btnRegisterLogin(
                    text: 'Register',
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Register_Page()));
                    },
                    color: colors.primarygreenColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //Button for login
                  btnRegisterLogin(
                    text: 'Login',
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()));
                    },
                    color: colors.secondarypurpleColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
