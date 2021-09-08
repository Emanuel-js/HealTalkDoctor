import 'package:heal_talk_doctor/index.dart';
import 'package:provider/provider.dart';

class admin_list_screen extends StatelessWidget {
  final searchcontroller = TextEditingController();
  Widget build(BuildContext context) {
    final doctor = Provider.of<List<Doctor>>(context);
    final patient = Provider.of<List<Patient>>(context);

    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(
          icon: Icon(
            Icons.sort_rounded,
            color: colors.black,
          ),
          itemBuilder: (context) {
            return List.generate(1, (index) {
              return PopupMenuItem(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlatButton(
                    child: Text('Sort by Name'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('Sort by date'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('Sort by id'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('Sort by speciality'),
                    onPressed: () {},
                  ),
                ],
              ));
            });
          },
        ),
        title: Label1(
          text: 'Doctors',
          color: colors.black,
        ),
        centerTitle: true,
        backgroundColor: colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: colors.greydark,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AdminNotification()));
            },
          ),
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert_rounded,
                color: colors.black,
              ),
              itemBuilder: (context) {
                return List.generate(1, (index) {
                  return PopupMenuItem(
                      child: FlatButton(
                    onPressed: () {
                      showInputMessage(context);
                    },
                    child: Text('Send message to all'),
                  ));
                });
              })
        ],
      ),
      backgroundColor: colors.white,
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: SearchTextField(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: ListView.builder(
                        itemCount: doctor?.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 16),
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  createRoute(
                                      DoctorDetailPage(doctor: doctor[index])));
                            },
                            child: doctor[index].isactive
                                ? Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        color: colors.white,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              blurRadius: 5, color: colors.grey)
                                        ]),
                                    margin: EdgeInsets.only(bottom: 2),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(doctor[index]?.img),
                                          //foregroundColor: colors.white,
                                          backgroundColor: colors.grey,
                                          minRadius: 40,
                                        ),
                                        /* Icon(
              Icons.account_circle_rounded,
              size: 50,
              color: colors.black,
            ),*/
                                        SizedBox(width: 10),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Label1(
                                              text: doctor[index]?.fullName,
                                              fontweight: FontWeight.bold,
                                            ),
                                            Label1(
                                              text: doctor[index]?.focus,
                                              color: colors.greydark,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : Text(''),
                          );
                        }),
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
