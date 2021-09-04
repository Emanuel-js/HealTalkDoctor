import 'package:flutter/cupertino.dart';
import 'package:heal_talk_doctor/index.dart';

class PatientSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: colors.bkColor,
        elevation: 0,
        title: Label1(
          text: 'Mr.x',
          color: colors.black,
          fontsize: 16.0,
        ),
        centerTitle: true,
        leading: btnBack(
          onpressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add_outlined,
                color: colors.secondarypurpleColor,
              ),
              onPressed: null)
        ],
      ),
      backgroundColor: colors.bkColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: scheduleList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(blurRadius: 4, color: colors.greydark),
                        ]),
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    padding: EdgeInsets.all(5),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label1(
                          text: scheduleList[index].date.toString() +
                              "\t" +
                              scheduleList[index].status,
                          color: colors.greydark,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.delete_rounded,
                              color: colors.redColor,
                            ),
                            onPressed: null)
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
