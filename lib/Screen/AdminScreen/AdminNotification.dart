import "package:heal_talk_doctor/index.dart";
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class AdminNotification extends StatefulWidget {
  @override
  _AdminNotificationState createState() => _AdminNotificationState();
}

class _AdminNotificationState extends State<AdminNotification> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AdminNewdoctorsScreen(),
    AdminReportScreen(),
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
