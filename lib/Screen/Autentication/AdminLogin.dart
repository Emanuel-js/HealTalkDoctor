import 'package:heal_talk_doctor/Screen/AdminScreen/AdminHome.dart';
import 'package:heal_talk_doctor/index.dart';

class LoginPageAdmin extends StatefulWidget {
  @override
  _LoginPageAdminState createState() => _LoginPageAdminState();
}

class _LoginPageAdminState extends State<LoginPageAdmin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool isvisble = false;
  final auth = AuthControlle();
  bool isChecked = false;
  bool isloading = true;
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
                      validetor(context);
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

  void validetor(BuildContext context) async {
    if (emailController.text.isEmpty) {
      DisplayMsg()
          .displayMessage(msg: "Please Enter an Email", context: context);
    } else if (!emailController.text.contains("@")) {
      DisplayMsg().displayMessage(msg: "Invalid Email", context: context);
    } else if (passwordController.text.isEmpty) {
      DisplayMsg().displayMessage(msg: "Enter Password", context: context);
    } else if (passwordController.text.length < 6) {
      DisplayMsg().displayMessage(
          msg: "Password must be > 6 character", context: context);
    } else {
      setState(() {
        isloading = false;
      });
      final u = await auth.login(
          emailController.text.trim(), passwordController.text.trim(), context);

      if (u) {
        setState(() {
          if (u) {
            DisplayMsg().displayMessage(
                msg: "Welcome Back", context: context, iserror: false);
            isloading = false;
            Navigator.push(context, createRoute(admin_home()));
          }
        });
      } else {
        setState(() {
          isloading = true;
        });
      }
    }
  }
}
