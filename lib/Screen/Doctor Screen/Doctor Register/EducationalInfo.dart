import 'dart:io';

import 'package:heal_talk_doctor/index.dart';
import 'package:smart_select/smart_select.dart';
import 'package:path/path.dart';

class EducationalInfo extends StatefulWidget {
  @override
  _EducationalInfoState createState() => _EducationalInfoState();
}

class _EducationalInfoState extends State<EducationalInfo> {
  final aboutController = TextEditingController();

  String focus = '';
  String expe = '';
  File _cv;
  File _licence;
  @override
  Widget build(BuildContext context) {
    List<S2Choice<String>> options = [
      S2Choice<String>(value: 'Adolescent', title: 'Adolescent psychiatry'),
      S2Choice<String>(value: 'Geriatric', title: 'Geriatric psychiatry'),
      S2Choice<String>(value: 'Disability', title: 'Disability psychiatry'),
      S2Choice<String>(value: 'Forensic', title: 'Forensic psychiatry'),
      S2Choice<String>(
          value: 'Administrative', title: 'Administrative psychiatry'),
      S2Choice<String>(value: 'Addiction', title: 'Addiction psychiatry'),
      S2Choice<String>(
          value: 'Military psychiatry', title: 'Military psychiatry'),
    ];
    List<S2Choice<String>> years = [
      S2Choice<String>(value: '1', title: '1 - 5 years'),
      S2Choice<String>(value: '2', title: '6 -10 years'),
      S2Choice<String>(value: '3', title: '> 15  years'),
    ];

    final colors = Appcolor();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData.fallback(),
        backgroundColor: colors.white,
      ),
      drawer: SignUpDrawer(),
      backgroundColor: colors.white,
      body: Container(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Text(
                  "About Your Career ",
                  style: header1(),
                )),
                SizedBox(
                  height: 40,
                ),
                getExpOption(years, S2ModalType.popupDialog, context),
                SizedBox(
                  height: 20,
                ),
                getFocusOption(options, S2ModalType.bottomSheet, context),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: aboutController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      maxLength: 1000,
                      decoration: InputDecoration(
                        hintText: "Tell us About you",
                        fillColor: colors.bkColor,
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Upload your CV"),
                    SizedBox(
                      width: 20,
                    ),
                    btnCustom(
                      // width: MediaQuery.of(context).size.width * 0.5,
                      text: 'Upload',
                      color: colors.secondarypurpleColor,
                      textcolor: colors.white,
                      onpress: () {
                        setState(() async {
                          File img = await getImgFromGullery(_cv);
                          _cv = File(img.path);

                          DisplayMsg().displayMessage(
                              context: context,
                              msg: "Your CV has beenis Uploaded!");
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Upload your Licence"),
                    SizedBox(
                      width: 20,
                    ),
                    btnCustom(
                      // width: MediaQuery.of(context).size.width * 0.5,
                      text: 'Upload',
                      color: colors.secondarypurpleColor,
                      textcolor: colors.white,
                      onpress: () {
                        setState(() async {
                          File img = await getImgFromGullery(_licence);
                          _licence = File(img.path);

                          DisplayMsg().displayMessage(
                              context: context,
                              msg: "Your Licence has beenis Uploaded!");
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: btnCustom(
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: "Next",
                    onpress: () {
                      doctorInputValidetor(context);
                      CustomProgress().progress();
                    },
                    textcolor: colors.white,
                    color: colors.primarygreenColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  doctorInputValidetor(context) async {
    if (_cv == null ||
        _licence == null ||
        expe == '' ||
        focus == '' ||
        aboutController.text.isEmpty) {
      DisplayMsg()
          .displayMessage(msg: "Please Enter required info", context: context);
    } else {
      String fileName = basename(_cv.path);
      String licensepath = basename(_licence.path);
      FirebaseApi().uploadFile(_cv);
      FirebaseApi().uploadFile(_licence);

      String cvUrl = await FirebaseApi().downloadFile(fileName);
      String licencUrl = await FirebaseApi().downloadFile(licensepath);
      PageDataApi().updatePageInfo(2, false, false);

      if (cvUrl != null && licencUrl != null) {
        FirebaseApi().updateEducationalInfo(
            expe, focus, aboutController.text.trim(), cvUrl, licencUrl);
        DisplayMsg().displayMessage(
            msg: "Your Cv and Licence have been successfully downloaded 🙋",
            context: context);
      }
      Navigator.pushReplacement(context, createRoute(Signcontract()));
    }
  }

  Widget getFocusOption(List option, S2ModalType style, context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: colors.bkColor, borderRadius: BorderRadius.circular(10)),
      child: SmartSelect<String>.single(
          modalType: style,
          title: 'Career',
          value: focus,
          modalFilter: false,
          modalHeader: false,
          modalStyle: S2ModalStyle(backgroundColor: colors.bkColor),
          choiceStyle: S2ChoiceStyle(
              accentColor: colors.call_bk_blue,
              clipBehavior: Clip.antiAlias,
              color: colors.primarypurpleColor,
              activeColor: colors.primarygreenColor),
          choiceType: S2ChoiceType.chips,
          // choiceGrouped: true,
          choiceItems: option,
          onChange: (state) {
            setState(() {
              focus = state.value;
            });
          }),
    );
  }

  Widget getExpOption(List option, S2ModalType style, context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: colors.bkColor, borderRadius: BorderRadius.circular(10)),
      child: SmartSelect<String>.single(
          modalType: style,
          title: 'Experience',
          value: focus,
          modalFilter: true,
          // choiceGrouped: true,
          choiceItems: option,
          onChange: (state) {
            setState(() {
              expe = state.value;
            });
          }),
    );
  }
}
