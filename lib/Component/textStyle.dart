import 'package:flutter/material.dart';

TextStyle header1({Color color = Colors.black}) {
  return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: color);
}

TextStyle header2({Color color = Colors.black}) {
  return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: color);
}

TextStyle body1({Color color = Colors.black}) {
  return TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: color);
}

TextStyle body2({Color color = Colors.black87}) {
  return TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: color);
}
