// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/BreakfastMeals/breakfast_menu.dart';
import '../constant/colors.dart';
import '../custom_widget/no_internet_widget.dart';

class HealthyLifeStyleTipsScreen extends StatelessWidget {
  const HealthyLifeStyleTipsScreen({super.key});

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
            size: 35,
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
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Healthy LifeStyle Tips",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Get.isDarkMode ? whiteColor : blackColor,
                          fontSize: 27,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode ? darkModeColor : whiteColor,
                          borderRadius: Get.isDarkMode ? BorderRadius.circular(10.0) : BorderRadius.circular(0.0),
                          border: Get.isDarkMode ? Border.all(
                              width: 2,
                              color: mainColor
                          ) : Border.all(
                              color: whiteColor
                          ),),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/checklistpng.png"),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Eat a variety of fresh or frozen fruits and \nvegetables",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Get.isDarkMode ? whiteColor : darkModeColor,
                                    ),
                                    textAlign: TextAlign.center,
                                    strutStyle: StrutStyle(
                                      leading: 0.9,
                                      height: 0.9,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode ? darkModeColor : whiteColor,
                          borderRadius: Get.isDarkMode ? BorderRadius.circular(10.0) : BorderRadius.circular(0.0),
                          border: Get.isDarkMode ? Border.all(
                              width: 2,
                              color: mainColor
                          ) : Border.all(
                              color: whiteColor
                          ),),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                          Image.asset("assets/checklistpng.png"),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Eat only non-fresh fruit packed in juice or \nwater.Avoid packaged heavy syrup",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                                strutStyle: StrutStyle(
                                  leading: 0.9,
                                  height: 0.9,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode ? darkModeColor : whiteColor,
                          borderRadius: Get.isDarkMode ? BorderRadius.circular(10.0) : BorderRadius.circular(0.0),
                          border: Get.isDarkMode ? Border.all(
                              width: 2,
                              color: mainColor
                          ) : Border.all(
                              color: whiteColor
                          ),),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                          Image.asset("assets/checklistpng.png"),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Eat whole grains, like whole-grain pasta \nand oatmeal, avoid white bread \nand frozen waffles",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                strutStyle: StrutStyle(
                                  leading: 0.9,
                                  height: 0.1,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode ? darkModeColor : whiteColor,
                          borderRadius: Get.isDarkMode ? BorderRadius.circular(10.0) : BorderRadius.circular(0.0),
                          border: Get.isDarkMode ? Border.all(
                              width: 2,
                              color: mainColor
                          ) : Border.all(
                              color: whiteColor
                          ),),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/checklistpng.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Healthy fats, such as olive oil and flaxseed\ncan lower cholesterol",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                  strutStyle: StrutStyle(
                                    leading: 0.9,
                                    height: 0.9,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode ? darkModeColor : whiteColor,
                          borderRadius: Get.isDarkMode ? BorderRadius.circular(10.0) : BorderRadius.circular(0.0),
                          border: Get.isDarkMode ? Border.all(
                              width: 2,
                              color: mainColor
                          ) : Border.all(
                              color: whiteColor
                          ),),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/checklistpng.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lean protein such as fish rich in omega-3 \nfatty acids and skinless eggs and poultry",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                  strutStyle: StrutStyle(
                                    leading: 0.9,
                                    height: 0.9,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode ? darkModeColor : whiteColor,
                          borderRadius: Get.isDarkMode ? BorderRadius.circular(10.0) : BorderRadius.circular(0.0),
                          border: Get.isDarkMode ? Border.all(
                              width: 2,
                              color: mainColor
                          ) : Border.all(
                              color: whiteColor
                          ),),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/checklistpng.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Cook with herbs. Instead of seasoning \nyour food with salt, try herbs. When \nbuying canned goods.",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                  strutStyle: StrutStyle(
                                    leading: 0.9,
                                    height: 0.2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BreakfastMenu(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              size: 40,
                              color: Get.isDarkMode ? darkModeColor : whiteColor,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                              backgroundColor: mainColor,
                              foregroundColor: lightPinkColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
