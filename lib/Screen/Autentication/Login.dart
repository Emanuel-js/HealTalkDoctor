import 'package:heal_talk_doctor/index.dart';

class Login_Page extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isvisble = true;
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: SingleChildScrollView(
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

              btnRegisterLogin(
                color: colors.primarygreenColor,
                text: "Login",
                onpress: () => {
                  //doctorhome_Page()
                  Navigator.push(context, createRoute((Welcomepage()))),
                  print(
                      "Email: ${emailController.text} \n password: ${passwordController.text} ischecked = ${isChecked}")
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
