import 'package:heal_talk_doctor/index.dart';

class doctorchatmenu_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: colors.primarygreenColor),
        elevation: 0,
        backgroundColor: colors.white,
        title: Label1(text: 'Chat List', color: colors.black),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.home_outlined,
            color: colors.primarygreenColor,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => DoctorHomePage()));

            //Navigator.push(context, createRoute(doctorhome_Page()));
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: colors.greydark,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DoctorNotification()));
              }),
        ],
      ),
      drawer: drawer(),
      backgroundColor: colors.white,
      // resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  SearchTextField(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      itemCount: patientlist.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 16),
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                createRoute(chat_page(
                                  Name: patientlist[index].Name,
                                  Status: patientlist[index].Onlinestatus,
                                  img: patientlist[index].img,
                                  patient_id: patientlist[index].Patient_id,
                                )));
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 10, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage(patientlist[index].img),
                                        maxRadius: 30,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                patientlist[index].Name,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Text(
                                                patientlist[index].Description,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  patientlist[index].Onlinestatus,
                                  style: TextStyle(
                                      color: (patientlist[index].Onlinestatus ==
                                              "Online")
                                          ? colors.primarygreenColor
                                          : colors.grey),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
