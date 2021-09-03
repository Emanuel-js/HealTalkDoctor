import 'package:heal_talk_doctor/index.dart';

showPrescriptionDialog(
  BuildContext context,
  String dr_name,
  String dr_address,
  String dr_phone,
) {
  Widget Prescribe = FlatButton(
      onPressed: () {
        showAlertDialog(context);
      },
      child: Text("Prescribe"));
  Widget Cancel = FlatButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: Text("Cancel"));

  AlertDialog alert = new AlertDialog(
    content: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Label1(
                  text: "Rx",
                  fontsize: 40.0,
                ),
                Label1(
                    text: dr_name + "\n" + dr_address + "\n" + dr_phone + "\n")
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Label1(
              text: "Patient Name: XXXXXXXXXXXXXX",
            ),
            Label1(
              text: "Age/DOB: 28, 11/24/1984",
            ),
            Label1(
              text: "Date: " +
                  DateTime.now().day.toString() +
                  "/" +
                  DateTime.now().month.toString() +
                  "/" +
                  DateTime.now().year.toString(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Rx: "),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Sig: "),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Disp: "),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Rf: "),
            ),
          ],
        ),
      ),
    ),
    actions: [Prescribe, Cancel],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
