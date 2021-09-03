import 'package:flutter/material.dart';
import 'package:heal_talk_doctor/index.dart';

class BuildText extends StatelessWidget {
  BuildText(
      {this.isvisble,
      this.iconPrefix,
      this.iconSufix,
      this.label,
      this.controller,
      this.onPress,
      this.keybordType,
      this.ispassword = true});

  final isvisble;
  final iconPrefix;
  final iconSufix;
  final controller;
  final label;
  final onPress;
  final keybordType;
  final ispassword;

  final colors = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: colors.bkColor,
              prefixIcon: iconPrefix,
              suffixIcon: _textClear(),
              labelText: label,
              border: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
                //borderSide: const BorderSide(),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide:
                    BorderSide(width: 1, color: colors.primarypurpleColor),
              )
              // errorText:
              //     controler.text.isEmpty ? "Please input ${lebel}" : null,
              // border: OutlineInputBorder(),
              ),
          keyboardType: keybordType,
          textInputAction: TextInputAction.done,
          obscureText: isvisble,
        ));
  }

  Widget _textClear() => ispassword
      ? IconButton(
          color: colors.primarygreenColor,
          onPressed: () {
            onPress();
          },
          icon: isvisble ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        )
      : controller.text.isEmpty
          ? Container(
              width: 0,
            )
          : IconButton(
              icon: Icon(
                Icons.close,
                color: colors.redColor,
              ),
              onPressed: () => controller.clear(),
            );
}
