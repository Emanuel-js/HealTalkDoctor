import 'package:flutter/material.dart';
import 'package:heal_talk_doctor/index.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DisplayNote extends StatefulWidget {
  final Patient patient;
  DisplayNote({this.patient});

  @override
  _DisplayNoteState createState() => _DisplayNoteState();
}

class _DisplayNoteState extends State<DisplayNote> {
  final histryControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color: Colors.black,
            ),
            shape: BoxShape.circle,
          ),
          child: Hero(
            tag: "note",
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.add_comment_outlined),
              onPressed: () {
                //Todo add a note
                addHistory(context);
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              //todo: title
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    "Take Patient History",
                    textAlign: TextAlign.center,
                    style: header1(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(
                    "${widget.patient?.firstName}  Medical History",
                    textAlign: TextAlign.center,
                    style: body1(),
                  ),
                ),
              ),

              StreamBuilder(
                  stream: RequestApi().notes(widget.patient.pId),
                  builder: (ctx, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                          child: Text(
                        "No patinet Histry is here plseas add one! 🚀",
                        style: header1(),
                      ));
                    final note = snapshot.data;
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: note.length,
                        itemBuilder: (ctx, index) {
                          print(note);
                          String time = DateFormat.yMMMd()
                              .add_jm()
                              .format(note[index].createdDate);
                          return Card(
                            margin: EdgeInsets.all(10),
                            elevation: 2,
                            child: ListTile(
                              title: Container(
                                  // margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(10),
                                  child: Text("${note[index].note}")),
                              subtitle: Container(
                                child: Text("$time"),
                              ),
                            ),
                          );
                        });
                  })
              //todo list of

              //todo add btn
            ],
          ),
        ));
  }

  addHistory(context) {
    // set up the buttons
    final colors = Appcolor();
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: colors.white,
      // contentPadding: EdgeInsets.all(30),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(
        "Add History",
        style: header2(
          color: colors.black,
        ),
        textAlign: TextAlign.center,
      ),
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildText(
              label: "History",
              ispassword: false,
              controller: histryControler,
              isvisble: false,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color: Colors.black,
            ),
            shape: BoxShape.circle,
          ),
          child: Hero(
            tag: "note",
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.add_comment_outlined),
              onPressed: () {
                if (histryControler.text.isEmpty) {
                  DisplayMsg().displayMessage(
                      msg: "add your some History!", context: context);
                } else {
                  RequestApi().addNewnote(
                      histryControler.text.trim(), widget.patient?.pId);
                  histryControler.clear();

                  Navigator.pop(context);
                }
              },
            ),
          ),
        )
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
}
