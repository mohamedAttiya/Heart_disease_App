// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constant/colors.dart';

class WeightOrAgeBMI extends StatelessWidget {
  final String name;
  const WeightOrAgeBMI({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 145,
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(width: 2, color: grayColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            name,
            style:
                TextStyle(color: lightBlackColor, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Image.asset("assets/images/mins.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Text(
                  "60",
                  style:
                      TextStyle(color: mainColor, fontSize: 19),
                ),
              ),
              InkWell(
                child: Image.asset("assets/images/add.png"),
              )
            ],
          ),
        )
      ]),
    );
  }
}
