import 'package:flutter/services.dart';
import 'package:heal_talk_doctor/index.dart';

class display_note extends StatefulWidget {
  String name;

  display_note({this.name});

  @override
  _display_noteState createState() => _display_noteState();
}

class _display_noteState extends State<display_note> {
  TextEditingController txtSubject = TextEditingController();

  TextEditingController txtDescription = TextEditingController();

  @override
  void addItems() {
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.bkColor,
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.add,color: colors.primarygreenColor,), onPressed: (){showSaveNote(context);})
        ],
        elevation: 0,
        backgroundColor: colors.bkColor,
        leading: btnBack(onpressed: () {
          Navigator.of(context).pop();
        }),
        title: Label1(
          text: widget.name+"'s\t Record" ,
          color: colors.black,
          fontsize: (widget.name.length>18?15.0:20.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // color: colors.white,
            child: ListView.builder(
                itemCount: doctorsnotelist.length,
                itemBuilder: (BuildContext, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 2,
                          color: colors.grey,
                        ),
                      ]
                    ),

                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    height: 100,
                    //color: colors.bkColor,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Label1(
                            text: doctorsnotelist[index].note_subject,
                            fontweight: FontWeight.bold,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Label1(
                            text: doctorsnotelist[index].note_description,
                          ),
                        ),
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

class doctors_note {
  String note_subject;
  String note_description;
  doctors_note({this.note_description, this.note_subject});
}

final List<doctors_note> doctorsnotelist = [
  doctors_note(
      note_subject: "Crazyness",
      note_description: "On july 12/121 we were in a meeting bla bla bla"),
  doctors_note(
      note_subject: "Hello",
      note_description: "On july 12/121 we were in a meeting bla bla bla"),
  doctors_note(
      note_subject: "Greeting",
      note_description: "On july 12/121 we were in a meeting bla bla bla"),
  doctors_note(
      note_subject: "Crazyness",
      note_description: "On july 12/121 we were in a meeting bla bla bla"),
  doctors_note(
      note_subject: "Hello",
      note_description: "On july 12/121 we were in a meeting bla bla bla"),
  doctors_note(
      note_subject: "Greeting",
      note_description: "On july 12/121 we were in a meeting bla bla bla"),
  doctors_note(
      note_subject: "Crazyness",
      note_description: "On july 12/121 we were in a meeting bla bla bla"),
  doctors_note(
      note_subject: "Hello",
      note_description: "On july 12/121 we were in a meeting bla bla bla"),
  doctors_note(
      note_subject: "Greeting",
      note_description: "On july 12/121 we were in a meeting bla bla bla"),
];
