import 'package:heal_talk_doctor/index.dart';

class admin_report_screen extends StatefulWidget {
  @override
  _admin_report_screenState createState() => _admin_report_screenState();
}

class _admin_report_screenState extends State<admin_report_screen> {
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
                                Navigator.push(
                                    context,
                                    createRoute(doctor_detail_page(
                                        name: Drlist[index].Name,
                                        proffession: Drlist[index].Description,
                                        img: Drlist[index].img,
                                        phone: Drlist[index].Phone,
                                        email: Drlist[index].Email,
                                        address: Drlist[index].Address)));
                              },
                            ),
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
