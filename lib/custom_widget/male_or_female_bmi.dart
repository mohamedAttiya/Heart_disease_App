// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:graduation_project/constant/colors.dart';

class MaleOrFemaleBMI extends StatefulWidget {
  final String image;
  final String nameOfImage;
  //final Function() isMale ;
  MaleOrFemaleBMI({
    Key? key,
    required this.image,
    required this.nameOfImage,
  }) : super(key: key);

  @override
  State<MaleOrFemaleBMI> createState() => _MaleOrFemaleBMIState();
}

class _MaleOrFemaleBMIState extends State<MaleOrFemaleBMI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          setState(() {
            
          });
        },
        child: Container(
          height: 120,
          width: 140,
          decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(width: 2, color: grayColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(widget.image),
              SizedBox(
                height: 8,
              ),
              Text(
                widget.nameOfImage,
                style: TextStyle(fontSize: 18, color: grayColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
