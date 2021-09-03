import 'package:heal_talk_doctor/index.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isvisble = true;
  bool isChecked = false;
  bool isloading = true;
  final auth = AuthControlle();
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final isactive = Provider.of<PageInfo>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      backgroundColor: colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.white,
        leading: btnBack(onpressed: () {
          Navigator.push(context, createRoute(mainpage()));
        }),
        actions: [
          GestureDetector(
            child: RichText(
              text: TextSpan(
                  text: 'Admin? ',
                  style: TextStyle(
                    color: colors.black,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: colors.primarygreenColor,
                          fontSize: 20,
                        )),
                  ]),
            ),
            onTap: () {
              Navigator.push(context, createRoute(Login_Page_Admin()));
            },
          )
        ],
      ),
      body: isloading
          ? SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Logo(context),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      //todo email
                      Container(
                        margin: EdgeInsets.only(bottom: 30, top: 30),
                        child: BuildText(
                          label: "Email",
                          ispassword: false,
                          controller: emailController,
                          iconPrefix: Icon(
                            Icons.email,
                            color: colors.primarygreenColor,
                          ),
                          isvisble: false,
                        ),
                      ),
                      //todo password
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: BuildText(
                          label: "Password",
                          ispassword: true,
                          controller: passwordController,
                          isvisble: isvisble,
                          onPress: () {
                            setState(() {
                              isvisble = !isvisble;
                            });
                          },
                        ),
                      ),
                      // check box
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: CheckBox1(
                          onChange: (newValue) {
                            setState(() {
                              isChecked = newValue;
                            });
                          },
                          title: "Remember Me",
                          isChecked: isChecked,
                        ),
                      ),
                      //todo button
                      SizedBox(
                        height: 20,
                      ),

                      Button1(
                          color: colors.primarygreenColor,
                          text: "Login",
                          onpress: () {
                            validetor(context, isactive);
                          })
                    ],
                  ),
                ),
              ),
            )
          : CustomProgress().progress(),
    );
  }

  void validetor(BuildContext context, PageInfo isactive) async {
    print("what");
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
      // DisplayMsg().displayMessage(
      //     msg: "Welcome Back", context: context, iserror: false);

      if (u && isactive != null) {
        print("WTF");
        setState(() {
          if (u && isactive.isaccepted) {
            DisplayMsg().displayMessage(
                msg: "Welcome Back", context: context, iserror: false);
            isloading = false;
            Navigator.push(context, createRoute(DoctorHomePage()));
          } else if (u) {
            isloading = false;
            DisplayMsg().displayMessage(
                msg: "Continue your progress !",
                context: context,
                iserror: false);
            Navigator.push(context, createRoute(Welcomepage()));
          } // } else if (u && isactive.progress == 2) {
          //   Navigator.push(context, createRoute(WaitScreen()));
          // }
        });
      } else {
        setState(() {
          isloading = true;
        });
      }
    }
  }
}
