import 'package:heal_talk_doctor/index.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class AdminHomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final doctor = Provider.of<List<Doctor>>(context);
    final patient = Provider.of<List<Patient>>(context);
    Map<String, double> usersdataMap = {
      "Doctors": doctor?.length?.toDouble(),
      "Patients": patient?.length?.toDouble(),
      // "Admins": userslist[0].admins,
    };

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
                          AuthControlle().logout();
                          Navigator.push(
                              context, createRoute(LoginPageAdmin()));
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
                      builder: (BuildContext context) => AdminNotification()));
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
                            text: '${patient?.length}',
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
                            text: "${doctor?.length}",
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
