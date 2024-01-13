import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constant/colors.dart';
import 'package:lottie/lottie.dart';

Widget noInternetWidget() {
  return Scaffold(
    body: Container(
      color: Get.isDarkMode ? Color(0xff181619) : whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Get.isDarkMode ? Lottie.asset('assets/animated/dark-no-internet-connection.json') : Lottie.asset('assets/animated/light-no-internet-connection.json'),
          SizedBox(
            height: 20,
          ),
          Text(
            textAlign: TextAlign.center,
            "Can\'t connect.. \nPlease check internet !",
            style: TextStyle(
              letterSpacing: 1.5,
              height: 1.5,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? whiteColor : darkModeColor,
            ),
          ),

        ],
      ),
    ),
  );
}
