// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class ListTileInMyAccountScreen extends StatelessWidget {
  final String textTitle;
  final String image;

  const ListTileInMyAccountScreen({
    Key? key,
    required this.image,
    required this.textTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListTile(
        leading: Image.asset(image),
        title: Text(
          textTitle,
          textAlign: TextAlign.start,
          style: TextStyle(
            color:Get.isDarkMode ? whiteColor : darkModeColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios,
            color: mainColor,
          ),
        ),
      ),
    );
  }
}
