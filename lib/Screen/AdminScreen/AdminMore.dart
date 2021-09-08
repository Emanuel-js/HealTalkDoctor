import 'package:heal_talk_doctor/index.dart';

class admin_more_screen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Label1(
          text: 'More',
          color: colors.black,
        ),
        centerTitle: true,
        backgroundColor: colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: colors.greydark,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AdminNotification()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.4,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        blurRadius: 5, spreadRadius: 3, color: colors.greydark)
                  ],
                  color: colors.white,
                ),
                child: Expanded(
                  child: Column(
                    children: [
                      Label1(
                        text: 'Profile',
                        color: colors.black,
                        fontweight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Label1(
                            text: 'Email ',
                            color: colors.greydark,
                          ),
                          containerProfile(
                            text: 'Yeheyes@gmail.com',
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Label1(
                            text: 'Password',
                            color: colors.greydark,
                          ),
                          containerProfile(
                            text: 'something',
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Label1(
                            text: 'Username',
                            color: colors.greydark,
                          ),
                          containerProfile(
                            text: 'Admin',
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      btnRegisterLogin(
                        text: 'Edit Profile',
                        color: colors.secondarypurpleColor,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.2,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        blurRadius: 5, spreadRadius: 3, color: colors.greydark)
                  ],
                  color: colors.white,
                ),
                child: Center(
                  child: btnRegisterLogin(
                    text: 'Add New Admin',
                    color: colors.primarygreenColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class containerProfile extends StatelessWidget {
  String text;
  containerProfile({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.05,
      child: TextField(
        textAlign: TextAlign.center,
        readOnly: true,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: colors.greydark),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: EdgeInsets.all(8),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100)),
        ),
      ),
    );
  }
}
