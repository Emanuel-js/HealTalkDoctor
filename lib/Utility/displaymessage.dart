import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "../index.dart";

class DisplayMsg {
  DisplayMsg({this.msg, this.context, this.iserror = true});
  final String msg;
  final context;
  final iserror;
  void displayMessage({String msg, context, iserror = true}) {
    Color color;
    final colors = Appcolor();
    iserror ? color = colors.redColor : color = colors.primarygreenColor;
    Fluttertoast.showToast(msg: msg, backgroundColor: color);
  }
}
