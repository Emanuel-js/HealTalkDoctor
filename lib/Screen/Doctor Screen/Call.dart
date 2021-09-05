import 'package:heal_talk_doctor/index.dart';

class call_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.call_bk_blue,
      body: Container(
        padding: EdgeInsets.all(40),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    child: Image(
                      image: AssetImage('assets/images/DoctorLogo.png'),
                      fit: BoxFit.cover,
                    ),
                    radius: MediaQuery.of(context).size.width * 0.15,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Label1(
                    text: 'Mr.x',
                    color: colors.white,
                    fontsize: 19.0,
                  ),
                  SizedBox(height: 15),
                  Label1(
                    text: '2:56',
                    color: colors.grey,
                    fontsize: 15.0,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.mic_off_outlined,
                        size: 30,
                      ),
                      onPressed: () {}),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 30,
                    child: IconButton(
                        icon: Icon(
                          Icons.call_end,
                          size: 30,
                        ),
                        onPressed: () {
                          // Navigator.push(context, createRoute(ChatList()));
                        }),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.speaker,
                        size: 30,
                      ),
                      onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
