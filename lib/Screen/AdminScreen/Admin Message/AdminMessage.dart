import 'package:heal_talk_doctor/index.dart';

class admin_send_message extends StatefulWidget {
  final floating_action_button;
  admin_send_message({this.floating_action_button});

  @override
  _admin_send_messageState createState() => _admin_send_messageState();
}

class _admin_send_messageState extends State<admin_send_message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Label1(
          text: 'sent messages',
          color: colors.black,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colors.white,
        leading: btnBack(
          onpressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: colors.white,
      floatingActionButton: widget.floating_action_button,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView.builder(
                itemCount: msglist.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, ind) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 2,
                              color: msglist[ind].messagetype == "Warning"
                                  ? colors.k_orange
                                  : colors.greydark)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(msglist[ind].message,
                            style: TextStyle(
                              color: colors.black,
                            )),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(msglist[ind].datesent),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
