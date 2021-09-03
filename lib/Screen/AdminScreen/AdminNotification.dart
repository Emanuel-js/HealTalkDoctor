import "package:heal_talk_doctor/index.dart";
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class admin_notification extends StatefulWidget {
  @override
  _admin_notificationState createState() => _admin_notificationState();
}

class _admin_notificationState extends State<admin_notification> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    admin_newdoctors_screen(),
    admin_report_screen(),
    admin_feedback_screen(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: _currentIndex,
        color: colors.primarygreenColor,
        activeColor: colors.primarygreenColor,
        backgroundColor: colors.white,
        items: [
          TabItem(icon: Icons.person_add, title: 'New Doctors'),
          TabItem(icon: Icons.list, title: 'Reports'),
          TabItem(icon: Icons.people, title: 'Feedbacks'),
        ],
        onTap: onTabTapped,
      ),
    );
  }
}
