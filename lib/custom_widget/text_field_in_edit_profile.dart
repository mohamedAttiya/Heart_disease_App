// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class TextFieldInEditProfile extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  const TextFieldInEditProfile({
    Key? key,
    required this.text,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          textAlign: TextAlign.start,

          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        height: 60,
        child: TextField(
          controller: controller,
          cursorColor: mainColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: Get.isDarkMode ? darkModeColor : smoothPinkColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: Get.isDarkMode ? BorderSide(color: mainColor) : BorderSide(
                color: smoothPinkColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide:Get.isDarkMode ? BorderSide(color: mainColor) : BorderSide(
                color: smoothPinkColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(
                color: smoothPinkColor,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
