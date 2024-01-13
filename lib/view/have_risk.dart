// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constant/colors.dart';
import 'package:graduation_project/view/healthylifestyletips_screen.dart';
import '../custom_widget/no_internet_widget.dart';
import 'find_doctor.dart';

class HaveRiskScreen extends StatelessWidget {
  const HaveRiskScreen(this.risk,{super.key});

  final String risk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Get.isDarkMode ? whiteColor : darkModeColor,
          ),
        ),
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        elevation: 0.0,
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "You have a risk of coronary heart disease CHD with Risk : $risk",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? whiteColor : darkModeColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,),
                    strutStyle: StrutStyle(
                      leading: 1.5,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Image.asset("assets/haveRisk.png"),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "You must take care of changing your life system, take this in hand with the diet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? whiteColor : darkModeColor,
                      fontSize: 17,
                    ),
                    strutStyle: StrutStyle(
                      leading: 1.5,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                            width: 2,
                            color: mainColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HealthyLifeStyleTipsScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Healthy Diet",
                          style: TextStyle(
                              color: mainColor, fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FindDoctor(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: mainColor,
                        ),
                        child: Center(
                          child: Text(
                            'Find Doctor',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return noInternetWidget();
          }
        },
        child: Center(
          child: CircularProgressIndicator(
            color: mainColor,
          ),
        ),
      ),
    );
  }
}
