import 'package:flutter/material.dart';
import 'package:graduation_project/constant/colors.dart';

import '../../model/onboarding_model.dart';

class buildOnboardingItem extends StatelessWidget {
  const buildOnboardingItem({
    super.key,
    required this.model,
  });

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: model.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: model.height * 0.15,
          ),
          Container(
            width: double.infinity,
            child: Image(
              image: AssetImage(model.image),
              height: model.height * 0.4,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: blackColor,
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            model.subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w200,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}