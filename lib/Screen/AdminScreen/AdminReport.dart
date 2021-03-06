import 'package:heal_talk_doctor/index.dart';

class AdminReportScreen extends StatefulWidget {
  @override
  _AdminReportScreenState createState() => _AdminReportScreenState();
}

class _AdminReportScreenState extends State<AdminReportScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: btnBack(
          onpressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Label1(
          text: "Reports",
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
              itemCount: reportlist.length,
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
                        Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              reportlist[index].report_description,
                              overflow: TextOverflow.fade,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(reportlist[index].sent_date),
                            GestureDetector(
                              child: Text(
                                "Doctor id: " +
                                    reportlist[index].doctor_id.toString(),
                                style: TextStyle(
                                  color: colors.secondarypurpleColor,
                                ),
                              ),
                              onTap: () {
                                //Todo Report
                                //   Navigator.push(
                                //       context,
                                //       createRoute(DoctorDetailPage(doctor:doctor[index],)));
                              },
                            )
                          ],
                        )
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
