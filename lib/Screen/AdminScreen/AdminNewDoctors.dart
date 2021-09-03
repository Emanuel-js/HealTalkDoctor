import 'package:heal_talk_doctor/index.dart';

class admin_newdoctors_screen extends StatefulWidget {
  @override
  _admin_newdoctors_screenState createState() =>
      _admin_newdoctors_screenState();
}

class _admin_newdoctors_screenState extends State<admin_newdoctors_screen> {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Label1(
          text: 'New Doctors',
          color: colors.black,
        ),
        centerTitle: true,
        backgroundColor: colors.white,
        elevation: 0,
        leading: btnBack(
          onpressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.85,
            color: colors.white,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: newdoctorslist.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      topLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 2,
                          color: colors.greydark),
                    ],
                    color: colors.white,
                  ),
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.03,
                      bottom: 20,
                      top: 5),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colors.primarygreenColor,
                          // color: Colors.primaries[
                          //   Random().nextInt(Colors.primaries.length)],
                        ),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/Human.jpeg'),
                          radius: 30,
                        ),
                      ),
                      Label1(
                        text: newdoctorslist[index].dr_Name,
                        fontweight: FontWeight.bold,
                        fontsize: 16.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Label1(
                        text: newdoctorslist[index].dr_email,
                        fontweight: FontWeight.bold,
                        fontsize: 16.0,
                        color: colors.greydark,
                        overflow: TextOverflow.ellipsis,
                      ),
                      btnCustom(
                        height: MediaQuery.of(context).size.height * 0.03,
                        text: "See Detail",
                        color: colors.primarygreenColor,
                        textcolor: colors.white,
                        width: MediaQuery.of(context).size.width * 0.3,
                        onpress: () {},
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class appBarnewdoctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBar(
      backgroundColor: colors.white,
      elevation: 0,
      leading: btnBack(
        onpressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
