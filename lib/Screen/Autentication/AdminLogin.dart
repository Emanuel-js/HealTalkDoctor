import 'package:heal_talk_doctor/Screen/AdminScreen/AdminHome.dart';
import 'package:heal_talk_doctor/index.dart';

class Login_Page_Admin extends StatefulWidget {
  @override
  _Login_Page_AdminState createState() => _Login_Page_AdminState();
}

class _Login_Page_AdminState extends State<Login_Page_Admin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool isvisble = false;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.bkColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: colors.bkColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    btnBack(
                      width: 35.0,
                      height: 35.0,
                      color: colors.bkColor,
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginPage()));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Label1(
                    text: '\t\tHi, Welcome back!',
                    fontweight: FontWeight.bold,
                    fontsize: 30.0,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildText(
                          label: "Email",
                          ispassword: false,
                          controller: emailController,
                          iconPrefix: Icon(Icons.email),
                          isvisble: false,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.08,
                        ),
                        BuildText(
                          label: "\tPassword",
                          ispassword: true,
                          controller: passwordController,
                          isvisble: isvisble,
                          onPress: () {
                            setState(() {
                              isvisble:
                              !isvisble;
                            });
                          },
                        ),
                        CheckboxListTile(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            'Remember Me',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: colors.greydark),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: btnRegisterLogin(
                    text: 'Login',
                    color: colors.primarygreenColor,
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => admin_home()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
