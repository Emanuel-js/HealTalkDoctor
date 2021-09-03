import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomProgress {
  Widget progress({double rad = 50}) {
    return Center(
      child: CircleAvatar(
          radius: rad,
          backgroundImage: AssetImage('assets/images/progress.gif')),
    );
  }
}
