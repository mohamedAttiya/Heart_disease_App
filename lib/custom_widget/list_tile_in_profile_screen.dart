// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class ListTileInProfileScreen extends StatelessWidget {
  final String my_image;
  final String my_text;
  const ListTileInProfileScreen({
    Key? key,
    required this.my_image,
    required this.my_text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Get.isDarkMode ? mainColor : grayColor),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Get.isDarkMode ? darkModeColor : grayColor.withOpacity(0.2),
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Image.asset(my_image),
                    title: Text(
                      my_text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Get.isDarkMode ? whiteColor : darkModeColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: mainColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
