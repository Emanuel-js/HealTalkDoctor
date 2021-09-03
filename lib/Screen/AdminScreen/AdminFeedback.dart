import 'package:heal_talk_doctor/index.dart';

class admin_feedback_screen extends StatefulWidget {
  @override
  _admin_feedback_screenState createState() => _admin_feedback_screenState();
}

class _admin_feedback_screenState extends State<admin_feedback_screen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: btnBack(
          onpressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Label1(
          text: "Feedbacks",
          color: colors.black,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colors.white,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: colors.white,
          child: Center(
            child: ListView.builder(
              itemCount: feedbacklist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 1,
                            color: colors.greydark,
                          ),
                        ]),
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Text(
                          feedbacklist[index].feedbackdescription,
                          overflow: TextOverflow.fade,
                        )),
                        Label1(
                          text: feedbacklist[index].sentDate,
                          color: colors.primarygreenColor,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
