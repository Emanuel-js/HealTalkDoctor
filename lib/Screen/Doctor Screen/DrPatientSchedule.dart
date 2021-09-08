import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:heal_talk_doctor/index.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';

class PatientSchedule extends StatefulWidget {
  @override
  _PatientScheduleState createState() => _PatientScheduleState();
}

class _PatientScheduleState extends State<PatientSchedule> {
  final discController = TextEditingController();
  String typeVal = '3';
  DateTime scheduleDate;
  List<S2Choice<String>> type = [
    S2Choice<String>(value: '1', title: 'extremely important'),
    S2Choice<String>(value: '2', title: 'Important'),
    S2Choice<String>(value: '3', title: 'Normal'),
  ];
  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<List<Schedule>>(context);
    print(schedule);
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          border: Border.all(
            color: Colors.blue,
          ),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          color: Colors.blueAccent,
          icon: Icon(Icons.add_alert),
          onPressed: () {
//Todo add a scheduleList
            addSchedule(context);
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: colors.bkColor,
        elevation: 0,
        title: Label1(
          text: 'Schedule',
          color: colors.black,
          fontsize: 16.0,
        ),
        centerTitle: true,
        leading: btnBack(
          onpressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: colors.bkColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: schedule != null
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: schedule.length,
                      itemBuilder: (context, index) {
                        String time = DateFormat.yMMMd()
                            .add_jm()
                            .format(schedule[index].schedule);

                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: schedule[index].type == '1'
                                  ? colors.primarygreenColor
                                  : colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    blurRadius: 4, color: colors.greydark),
                              ]),
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          padding: EdgeInsets.all(5),
                          child: Container(
                            color: schedule[index].type == '1'
                                ? colors.primarygreenColor
                                : colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text("$time"),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text(schedule[index].dics),
                                    ),
                                  ],
                                ),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: Colors.redAccent,
                                //     border: Border.all(
                                //       color: Colors.blue,
                                //     ),
                                //     shape: BoxShape.circle,
                                //   ),
                                //   child: IconButton(
                                //       icon: Icon(
                                //         Icons.delete_rounded,
                                //         color: Colors.black87,
                                //       ),
                                //       onPressed: () {}),
                                // )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : Container(
                  child: Center(
                      child: Text(
                    "No Schedule here! 😞",
                    style: header1(),
                  )),
                ),
        ),
      ),
    );
  }

  addSchedule(context) {
    // set up the buttons
    final colors = Appcolor();
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: colors.white,
      // contentPadding: EdgeInsets.all(30),

      actionsPadding: EdgeInsets.all(10),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text("Add Schedule",
          style: header2(
            color: colors.black,
          )),
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildText(
              label: "discription",
              ispassword: false,
              controller: discController,
              isvisble: false,
            ),
            SizedBox(
              height: 30,
            ),
            DateTimeField(
                mode: DateTimeFieldPickerMode.date,
                decoration: const InputDecoration(
                  hintText: 'Schedule',
                  fillColor: Colors.amber,
                ),
                selectedDate: scheduleDate,
                onDateSelected: (DateTime value) {
                  setState(() {
                    scheduleDate = value;
                  });
                }),
            SizedBox(
              height: 20,
            ),
            getFocusOption(type, S2ModalType.bottomSheet, context),
          ],
        ),
      ),
      actions: [
        Button1(
          text: "Cancel",
          color: Colors.red,
          onpress: () {
            Navigator.pop(context);
          },
        ),
        Button1(
          color: Colors.blueGrey,
          text: "Add",
          onpress: () {
            if (scheduleDate == null) {
              DisplayMsg()
                  .displayMessage(msg: "add your schedule!", context: context);
            } else {
              RequestApi().addNewschedule(
                  scheduleDate, discController.text.trim(), typeVal);
              discController.clear();
              scheduleDate = null;
              Navigator.pop(context);
            }

            // FirebaseApi().updatePateintRequest(rm);
            //todo add scheduleList
          },
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget getFocusOption(List option, S2ModalType style, context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: colors.bkColor, borderRadius: BorderRadius.circular(10)),
      child: SmartSelect<String>.single(
          modalType: style,
          title: 'Type',
          value: typeVal,
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
              typeVal = state.value;
            });
          }),
    );
  }
}
