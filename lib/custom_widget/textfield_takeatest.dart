// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:graduation_project/constant/colors.dart';
class TextFieldTakeATest extends StatelessWidget {

  final VoidCallback? onTap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const TextFieldTakeATest({super.key, this.controller, this.onTap, this.keyboardType = TextInputType.number,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      keyboardType: keyboardType,
      cursorColor: mainColor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(color: mainColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(color: mainColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
      ),
    );
  }
}
