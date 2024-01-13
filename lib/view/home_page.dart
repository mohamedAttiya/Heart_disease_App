// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:graduation_project/theme/app_theme.dart';
import '../constant/colors.dart';
import '../custom_widget/drawer_menu.dart';
import '../custom_widget/main_button.dart';
import '../custom_widget/no_internet_widget.dart';
import 'take_atest_1_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        iconTheme: IconThemeData(
            color: Get.isDarkMode ? whiteColor : darkModeColor, size: 30),
        actions: [
          IconButton(
            icon: Get.isDarkMode
                ? Icon(CupertinoIcons.moon_stars)
                : Icon(CupertinoIcons.brightness),
            onPressed: () {
              setState(() {
                MyThemes().changeTheme();
              });
            },
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      drawer: drawerMenu(context),
      body: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return SafeArea(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Welcome to Healthy Heart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset("assets/home.png"),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          child: Text(
                            "Coronary artery disease (CAD) is one of the common diseases around the world. This necessitates a prompt and precise identification of cardiac disease. Heart disease can be managed effectively with a combination of lifestyle changes.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Get.isDarkMode ? whiteColor : darkModeColor,
                              fontSize: 20,
                            ),
                            strutStyle: StrutStyle(
                              fontSize: 20,
                              leading: 0.9,
                              height: 0.9,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: MainButton(
                          text: "Take a Test",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TakeATest1Screen(),
                              ),
                            );
                          },
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
