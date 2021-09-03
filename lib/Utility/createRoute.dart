import 'package:heal_talk_doctor/index.dart';

Route createRoute(Widget screen) {
  return PageRouteBuilder(
      transitionsBuilder: (context, animation, animationTime, child) {
    animation =
        CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
    return ScaleTransition(
        scale: animation, alignment: Alignment.center, child: child);
  }, pageBuilder: (context, animation, animationTime) {
    return screen;
  });
}
