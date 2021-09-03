import 'package:heal_talk_doctor/index.dart';

/*
void main()=>runApp(MaterialApp(
  home: Register_Page(),
));

 */
class Register_Page extends StatefulWidget {
  @override
  _Register_PageState createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  final _formkey = GlobalKey<FormState>();
  final colors = Appcolor();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isvisble = true;
  bool isloading = true;
  bool isChecked = false;
  final auth = AuthControlle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: colors.bkColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: colors.bkColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                builder: (BuildContext context) => mainpage()));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '\t\tCreate\n\t\tAccount',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.99,
                    // height: MediaQuery.of(context).size.height * 0.9,
                    child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10, top: 50),
                              child: BuildText(
                                label: "Full Name",
                                ispassword: false,
                                controller: nameController,
                                iconPrefix: Icon(
                                  Icons.person,
                                  color: colors.primarygreenColor,
                                ),
                                isvisble: false,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20, top: 10),
                              child: BuildText(
                                label: "Email",
                                ispassword: false,
                                keybordType: TextInputType.emailAddress,
                                controller: emailController,
                                iconPrefix: Icon(
                                  Icons.email,
                                  color: colors.primarygreenColor,
                                ),
                                isvisble: false,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 30),
                              child: BuildText(
                                label: "Password",
                                ispassword: true,
                                controller: passwordController,
                                isvisble: isvisble,
                                onPress: () {
                                  setState(
                                    () {
                                      isvisble = !isvisble;
                                    },
                                  );
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 30),
                              child: BuildText(
                                label: "Confirm Password",
                                ispassword: true,
                                controller: confirmPasswordController,
                                isvisble: isvisble,
                                onPress: () {
                                  setState(
                                    () {
                                      isvisble = !isvisble;
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                //////////////////Create account
                Center(
                  child: btnRegisterLogin(
                    text: 'Create Account',
                    color: colors.primarygreenColor,
                    onpress: () {
                      validators(context);
                    },
                  ),
                ),
                /////////////////////////////////////
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?  '),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginPage()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colors.primarygreenColor,
                        ),
                      ),
                    ),
                    //onPressed: null,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> validators(BuildContext context) async {
    if (emailController.text.isEmpty) {
      DisplayMsg()
          .displayMessage(msg: "Please Enter an Email", context: context);
    } else if (!emailController.text.contains("@")) {
      DisplayMsg().displayMessage(msg: "Invalid Email", context: context);
    } else if (nameController.text.length < 4) {
      DisplayMsg().displayMessage(
          msg: "Name must be atlist 3 character", context: context);
    } else if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      DisplayMsg()
          .displayMessage(msg: "lease insert password! 🙄", context: context);
    } else if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      DisplayMsg().displayMessage(
          msg: "password must be the same!☹️", context: context);
    } else if (passwordController.text.length < 6) {
      DisplayMsg().displayMessage(
          msg: "Password must be > 6 character ☹️", context: context);
    } else {
      setState(() {
        isloading = false;
      });
      final u = await auth.regsiter(nameController.text.trim(),
          emailController.text.trim(), passwordController.text.trim(), context);

      if (u) {
        setState(() {
          isloading = false;
          Navigator.pushReplacement(context, createRoute((Confirmationpage())));
          DisplayMsg().displayMessage(
            msg: "You are Seccsessfuly registerd",
            context: context,
          );
        });
      } else {
        setState(() {
          isloading = true;
        });
      }
    }
  }
}
