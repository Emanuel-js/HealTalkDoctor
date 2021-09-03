import 'dart:io';

import 'package:heal_talk_doctor/index.dart';
import 'package:smart_select/smart_select.dart';

class EducationalInfo extends StatefulWidget {
  @override
  _EducationalInfoState createState() => _EducationalInfoState();
}

class _EducationalInfoState extends State<EducationalInfo> {
  final experienceController = TextEditingController();

  final aboutController = TextEditingController();

  final foccuseController = TextEditingController();
  String focus = '';
  String expe = '';
  File _image;
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
              getExpOption(years, S2ModalType.popupDialog),
              SizedBox(
                height: 20,
              ),
              getFocusOption(options, S2ModalType.bottomSheet),
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
              Text("Upload your CV"),
              SizedBox(
                height: 10,
              ),
              btnCustom(
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
              SizedBox(
                height: 50,
              ),
              Container(
                child: btnCustom(
                  width: MediaQuery.of(context).size.width * 0.3,
                  text: "Next",
                  onpress: () {
                    Navigator.push(context, createRoute(Signcontract()));
                  },
                  textcolor: colors.white,
                  color: colors.primarygreenColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getFocusOption(List option, S2ModalType style) {
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

  Widget getExpOption(List option, S2ModalType style) {
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
