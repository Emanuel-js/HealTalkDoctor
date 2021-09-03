import 'dart:io';

import 'package:gender_picker/source/enums.dart';
import 'package:heal_talk_doctor/index.dart';
import 'package:date_field/date_field.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:path/path.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final nameTitel = TextEditingController();
  final addressController = TextEditingController();
  final phoneControler = TextEditingController();
  String gender = "Male";
  File _image;

  String title = "Add";
  @override
  void initState() {
    super.initState();
    title = "Add";
  }

  DateTime dob;
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
                BuildText(
                  controller: nameTitel,
                  label: "Name Title eg. DR",
                  onPress: () {},
                  ispassword: false,
                  isvisble: false,
                ),
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
                      selectedDate: dob,
                      onDateSelected: (DateTime value) {
                        setState(() {
                          dob = value;
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
                _image?.exists() != null || _image != null
                    ? CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: FileImage(_image),
                      )
                    : Text("Inset profile"),

                SizedBox(
                  height: 20,
                ),
                Container(
                  // width: MediaQuery.of(context).size.width * 0.8,
                  // height: MediaQuery.of(context).size.height * 0.3,
                  color: colors.white,
                  child: Align(
                    // alignment: Alignment.bottomCenter,
                    child: Button1(
                      // width: MediaQuery.of(context).size.width * 0.5,
                      text: 'profile Image',
                      color: colors.secondarypurpleColor,
                      onpress: () {
                        setState(() async {
                          File img = await getImgFromGullery(_image);
                          _image = File(img.path);

                          DisplayMsg().displayMessage(
                              context: context, msg: "Image is Uploaded!");
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                btnCustom(
                  width: MediaQuery.of(context).size.width * 0.6,
                  text: title,
                  onpress: () {
                    doctorInputValidetor(context);
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

  doctorInputValidetor(context) async {
    if (addressController.text.isEmpty ||
        phoneControler.text.isEmpty ||
        nameTitel.text.isEmpty) {
      DisplayMsg()
          .displayMessage(msg: "Please Enter required info", context: context);
    } else if (dob == null) {
      DisplayMsg().displayMessage(msg: "Invalid DOB", context: context);
    } else if (_image == null) {
      DisplayMsg()
          .displayMessage(msg: "profile is required!", context: context);
    } else {
      String fileName = basename(_image.path);

      FirebaseApi().uploadFile(_image);
      String imgUrl = await FirebaseApi().downloadFile(fileName);
      if (imgUrl != null) {
        setState(() {
          title = "Next";
        });
        FirebaseApi().updatePersonalInfo(
            gender,
            dob,
            imgUrl,
            addressController.text.trim(),
            phoneControler.text.trim(),
            nameTitel.text.trim());
        PageDataApi().updatePageInfo(1, false, false);
        Navigator.pushReplacement(context, createRoute(EducationalInfo()));
      }
    }
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
