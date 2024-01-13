// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:graduation_project/constant/colors.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SwitchListTile(
          title: Text(
            'Dark Mode',
            style: TextStyle(
                color: blackColor,
                fontWeight: FontWeight.w800,
                fontSize: 20),
          ),
          value: _lights,
          activeColor: mainColor,
          inactiveTrackColor: Colors.grey,
          onChanged: (bool value) {
            setState(() {
              _lights = value;
            });
          },
          secondary: Image.asset("assets/images/dark_mode.png")),
    );
  }
}
