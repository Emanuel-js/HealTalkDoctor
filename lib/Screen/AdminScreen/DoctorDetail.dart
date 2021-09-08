import 'dart:math';

import 'package:heal_talk_doctor/index.dart';

// Specific Doctor Display

class DoctorDetailPage extends StatelessWidget {
  Doctor doctor;
  DoctorDetailPage({this.doctor});
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
                    backgroundImage: NetworkImage(doctor?.img),
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
                            text: doctor?.fullName,
                            fontsize: 18.0,
                            fontweight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Label1(
                            text: doctor.focus,
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
                                  text: doctor?.fullName,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                container_doctor_detail(
                                  icon: Icon(
                                    Icons.email,
                                    color: colors.redColor,
                                  ),
                                  text: doctor?.email,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                container_doctor_detail(
                                  icon: Icon(
                                    Icons.phone,
                                    color: colors.primarygreenColor,
                                  ),
                                  text: doctor?.phone,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                container_doctor_detail(
                                  icon: Icon(
                                    Icons.location_on,
                                    color: colors.k_orange,
                                  ),
                                  text: doctor?.address,
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
                  SingleChildScrollView(
                    child: Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        color: colors.white,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
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
                                        Expanded(
                                          child: Image(
                                            image: NetworkImage(doctor.cv),
                                            fit: BoxFit.fill,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                6.5,
                                          ),
                                        )
                                      ],
                                    )),
                              )
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Row(
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
                    ),
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
