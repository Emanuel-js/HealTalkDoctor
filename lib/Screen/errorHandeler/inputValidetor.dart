import 'dart:io';

import 'package:heal_talk_doctor/index.dart';
import 'package:flutter/material.dart';

class ValidatorCecker {
  bool doctorInputValidetor(
      {TextEditingController address,
      TextEditingController phone,
      DateTime dob,
      String gender,
      File profile,
      context}) {
    bool isvalid = false;
    if (address.text.isEmpty || phone.text.isEmpty) {
      DisplayMsg()
          .displayMessage(msg: "Please Enter an Addres", context: context);
      isvalid = false;
    } else if (dob == null) {
      DisplayMsg().displayMessage(msg: "Invalid DOB", context: context);
      isvalid = false;
    } else if (profile == null) {
      DisplayMsg()
          .displayMessage(msg: "profile is required!", context: context);
      isvalid = false;
    } else {
      isvalid = true;
    }

    return isvalid;
  }
}
