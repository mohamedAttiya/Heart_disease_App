// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

import '../constant/colors.dart';

class TestWithYesOrNo extends StatelessWidget {
  final String text;
  final ValueChanged onChanged;

  int value = 1;

   TestWithYesOrNo({
    Key? key,
    required this.text,
     required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          text,
          style: TextStyle(color: lightBlackColor, fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        StatefulBuilder(
          builder: (context, setState) {
            return Row(
              children: [
                Container(
                  height: 50,
                  width: 135,
                  decoration:  BoxDecoration(
                    color: value == 1 ? mainColor :whiteColor,
                    border: Border.all(width: 2, color: mainColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        onChanged(1);
                        setState(() => value = 1);
                      },
                      child:  Text(
                        "Yes",
                        style: TextStyle(
                          color: value == 1 ? whiteColor :mainColor ,
                          fontSize: 15,
                        ),
                      )),
                ),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  height: 50,
                  width: 135,
                  decoration: BoxDecoration(
                    color: value == 0 ? mainColor :whiteColor,
                    border: Border.all(width: 2, color: mainColor),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        onChanged(0);
                        setState(() => value = 0);

                      },
                      child:  Text(
                        "No",
                        style: TextStyle(
                          color: value == 0 ? whiteColor :mainColor,
                          fontSize: 15,
                        ),
                      )),
                )
              ],
            );
          }
        ),
      ]),
    );
  }
}
