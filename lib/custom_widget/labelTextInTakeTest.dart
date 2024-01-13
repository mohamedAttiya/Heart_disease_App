// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LabelTextInTakeTest extends StatelessWidget {
  final String text;
  LabelTextInTakeTest({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
