import 'package:heal_talk_doctor/index.dart';
import 'package:pie_chart/pie_chart.dart';

class admin_home_screen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.bkColor,
        elevation: 0,
        title: Label1(text: 'Performance', color: colors.black),
        centerTitle: true,
        leading: PopupMenuButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: colors.black,
            ),
            itemBuilder: (context) {
              return List.generate(
                  1,
                  (index) => PopupMenuItem(
                          child: FlatButton(
                        child: Text('Logout'),
                        onPressed: () {
                          Navigator.push(
                              context, createRoute(Login_Page_Admin()));
                        },
                      )));
            }),
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
                      builder: (BuildContext context) => admin_notification()));
            },
          ),
        ],
      ),
      backgroundColor: colors.bkColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            color: colors.bkColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: <BoxShadow>[
                      BoxShadow(blurRadius: 5, color: colors.greydark)
                    ],
                    color: colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: PieChart(
                    showChartValuesOutside: true,
                    dataMap: usersdataMap,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 32,
                    chartRadius: MediaQuery.of(context).size.width,
                    chartType: ChartType.ring,
                    colorList: [
                      colors.secondarypurpleColor,
                      colors.primarygreenColor,
                      colors.k_lightOrange,
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: <BoxShadow>[
                      BoxShadow(blurRadius: 5, color: colors.greydark)
                    ],
                    color: colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: PieChart(
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: false,
                    dataMap: ratingdataMap,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 32,
                    chartRadius: MediaQuery.of(context).size.width,
                    chartType: ChartType.disc,
                    colorList: [
                      colors.k_dimred,
                      colors.k_orange,
                      colors.lightblue,
                      colors.secondarypurpleColor,
                      colors.primarygreenColor,
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colors.primarygreenColor,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Label1(
                            text: userslist[0].patients.toInt().toString(),
                            color: colors.white,
                            fontsize: 25.0,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Label1(
                            text: 'Total Patients',
                            color: colors.white,
                            fontsize: 18.0,
                          )
                        ],
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colors.secondarypurpleColor,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Label1(
                            text: userslist[0].doctors.toInt().toString(),
                            color: colors.white,
                            fontsize: 25.0,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Label1(
                            text: 'Total Doctors',
                            color: colors.white,
                            fontsize: 18.0,
                          )
                        ],
                      )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Map<String, double> usersdataMap = {
  "Doctors": userslist[0].doctors,
  "Patients": userslist[0].patients,
  "Admins": userslist[0].admins,
};

Map<String, double> ratingdataMap = {
  "Rating 1-1.9": ratinglist[0].rating,
  "Rating 2-2.9": ratinglist[1].rating,
  "Rating 3-3.9": ratinglist[2].rating,
  "Rating 4-4.9": ratinglist[3].rating,
  "Rating 5": ratinglist[4].rating,
};

class TotalRating {
  double rating;
  TotalRating({this.rating});
}

List<TotalRating> ratinglist = [
  TotalRating(rating: 20),
  TotalRating(rating: 66),
  TotalRating(rating: 90),
  TotalRating(rating: 150),
  TotalRating(rating: 112),
];

class userstat {
  double doctors, patients, admins;
  userstat({this.admins, this.doctors, this.patients});
}

List<userstat> userslist = [
  userstat(doctors: 15678, admins: 2000, patients: 13312),
];
