import 'dart:math';

import 'package:heal_talk_doctor/index.dart';

// Specific Doctor Display

class doctor_detail_page extends StatelessWidget {
  String name;
  String proffession;
  String img;
  String dr_id;
  int phone;
  String email;
  String address;
  doctor_detail_page(
      {this.name,
      this.proffession,
      this.img,
      this.address,
      this.email,
      this.dr_id,
      this.phone});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.white,
        leading: btnBack(onpressed: () {
          Navigator.of(context).pop();
        }),
      ),
      backgroundColor: colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(img),
                    radius: MediaQuery.of(context).size.width * 0.2,
                    backgroundColor: colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    //height: MediaQuery.of(context).size.height * 0.3,
                    decoration: DecorationContainer,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Label1(
                            text: name,
                            fontsize: 18.0,
                            fontweight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Label1(
                            text: proffession,
                            color: colors.greydark,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                container_doctor_detail(
                                  icon: Icon(Icons.person),
                                  text: name,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                container_doctor_detail(
                                  icon: Icon(
                                    Icons.email,
                                    color: colors.redColor,
                                  ),
                                  text: email,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                container_doctor_detail(
                                  icon: Icon(
                                    Icons.phone,
                                    color: colors.primarygreenColor,
                                  ),
                                  text: phone.toString(),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                container_doctor_detail(
                                  icon: Icon(
                                    Icons.location_on,
                                    color: colors.k_orange,
                                  ),
                                  text: address,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    color: colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: new List.generate(
                          5,
                          (index) => GestureDetector(
                                onTap: () {},
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: 10,
                                        right: 0,
                                        top: 10,
                                        bottom: 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: colors.greydark,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(blurRadius: 2)
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Label1(text: 'CV'),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/CV.jpg'),
                                          fit: BoxFit.fill,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6.5,
                                        )
                                      ],
                                    )),
                              )),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      btnCustom(
                        text: 'Message',
                        color: colors.primarygreenColor,
                        textcolor: colors.white,
                        onpress: () {
                          Navigator.push(
                              context, createRoute(admin_normal_message()));
                        },
                      ),
                      btnCustom(
                        text: 'Warning',
                        color: colors.secondarypurpleColor,
                        textcolor: colors.white,
                        onpress: () {
                          Navigator.push(
                              context, createRoute(admin_warning_message()));
                        },
                      ),
                      btnCustom(
                        text: 'Block',
                        color: colors.k_red,
                        textcolor: colors.white,
                        onpress: () {
                          showAlertDialog(context);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
