import 'package:heal_talk_doctor/index.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class admin_home extends StatefulWidget {
  @override
  _admin_homeState createState() => _admin_homeState();
}

class _admin_homeState extends State<admin_home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AdminHomeScreen(),
    admin_list_screen(),
    admin_more_screen()
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
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.list, title: 'List'),
          TabItem(icon: Icons.people, title: 'More'),
        ],
        onTap: onTabTapped,
      ),
    );
  }
}
