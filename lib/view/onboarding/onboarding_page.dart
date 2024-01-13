// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:graduation_project/constant/colors.dart';
import 'package:graduation_project/model/onboarding_model.dart';
import 'package:graduation_project/view/registration/register_page.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constant/string_image.dart';
import '../../constant/text.dart';
import 'build_onboarding_item.dart';


class OnboardingPage extends StatefulWidget {
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  final controller = LiquidController();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final pages = [
      buildOnboardingItem(
        model: OnboardingModel(
          image: tOnboardingImage1,
          title: tOnboardingTitle1,
          subTitle: tOnboardingSubTitle1,
          backgroundColor: tOnBoardingColor1,
          height: size.height,
        ),
      ),
      buildOnboardingItem(
        model: OnboardingModel(
          image: tOnboardingImage2,
          title: tOnboardingTitle2,
          subTitle: tOnboardingSubTitle2,
          backgroundColor: tOnBoardingColor2,
          height: size.height,
        ),
      ),
      buildOnboardingItem(
        model: OnboardingModel(
          image: tOnboardingImage3,
          title: tOnboardingTitle3,
          subTitle: tOnboardingSubTitle3,
          backgroundColor: tOnBoardingColor3,
          height: size.height,
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: controller,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            onPageChangeCallback: onPageChangedCallback,
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 20.0,
            child: OutlinedButton(
              onPressed: () {
                int nextPage = controller.currentPage +1;
                controller.animateToPage(page: nextPage);
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black26),
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
                onPrimary: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: mainColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Container(
              width: 60,
              height: 35,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  RegisterPage(),
                    ),
                  );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 130,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 3,
              effect: WormEffect(
                activeDotColor: mainColor,
                dotHeight: 8.0,
                dotWidth: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPageChangedCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}


