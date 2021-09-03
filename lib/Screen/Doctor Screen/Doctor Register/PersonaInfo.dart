import 'dart:io';

import 'package:gender_picker/source/enums.dart';
import 'package:heal_talk_doctor/index.dart';
import 'package:date_field/date_field.dart';
import 'package:gender_picker/gender_picker.dart';

class personal_info extends StatefulWidget {
  @override
  _personal_infoState createState() => _personal_infoState();
}

class _personal_infoState extends State<personal_info> {
  File _image;

  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final phoneControler = TextEditingController();
  String gender = "Male";
  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.white,
      appBar: AppBar(
        title: Label1(
          text: "Personal Information",
          color: colors.greydark,
        ),
        centerTitle: true,
        backgroundColor: colors.white,
        elevation: 0,
        leading: btnBack(
          onpressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            // height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 20,
                ),
                BuildText(
                  controller: addressController,
                  label: "adress",
                  onPress: () {},
                  ispassword: false,
                  isvisble: false,
                ),
                SizedBox(
                  height: 20,
                ),
                BuildText(
                  controller: phoneControler,
                  keybordType: TextInputType.phone,
                  label: "phone",
                  onPress: () {},
                  ispassword: false,
                  isvisble: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 90, top: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors.bkColor,
                  ),
                  child: DateTimeField(
                      mode: DateTimeFieldPickerMode.date,
                      decoration: const InputDecoration(
                        hintText: 'DOB',
                      ),
                      selectedDate: selectedDate,
                      onDateSelected: (DateTime value) {
                        setState(() {
                          selectedDate = value;
                        });
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 30),
                  child: genderpik(),
                ),
                //
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: colors.white,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Profile Picture',
                          style: body2(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: _image != null
                            ? Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(_image))),
                              )
                            : Text("uploade your photo"),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: btnCustom(
                          // width: MediaQuery.of(context).size.width * 0.5,
                          text: 'Upload',
                          color: colors.secondarypurpleColor,
                          textcolor: colors.white,
                          onpress: () {
                            setState(() async {
                              File img = await getImgFromGullery(_image);
                              _image = File(img.path);
                              // print(_image);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                btnCustom(
                  width: MediaQuery.of(context).size.width * 0.6,
                  text: "Next",
                  onpress: () {
                    Navigator.push(context, createRoute(EducationalInfo()));
                  },
                  textcolor: colors.white,
                  color: colors.primarygreenColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget genderpik() {
    return Container(
      child: GenderPickerWithImage(
        showOtherGender: false,
        verticalAlignedText: false,
        selectedGender: Gender.Male,
        selectedGenderTextStyle: TextStyle(
            color: colors.primarygreenColor, fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.normal),

        onChanged: (Gender g) {
          g.index == 0 ? gender = "Male" : gender = "Female";
        },
        equallyAligned: true,
        animationDuration: Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 50, //default : 40
      ),
    );
  }
}
