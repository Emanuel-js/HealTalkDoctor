import 'package:flutter/material.dart';
import 'package:heal_talk_doctor/Color/color.dart';

class AppTheme {
  static ThemeData define() {
    final colors = Appcolor();
    return ThemeData(
      fontFamily: "lato",
      primaryColor: colors.primarygreenColor,
      scaffoldBackgroundColor: colors.white,
      accentColor: colors.primarypurpleColor,
      textTheme: TextTheme(
        headline4: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.w100,
          color: Colors.black45,
        ),
      ),
    );
  }
}
