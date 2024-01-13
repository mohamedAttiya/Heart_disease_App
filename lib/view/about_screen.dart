// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../custom_widget/main_button.dart';
import '../custom_widget/no_internet_widget.dart';
import 'my_account_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "About",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Get.isDarkMode ? whiteColor : darkModeColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Get.isDarkMode ? whiteColor : darkModeColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  MyAccountScreen()),
            );
          },
        ),
      ),
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
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Get.isDarkMode? Image.asset("assets/lodo_dark.png") : Image.asset("assets/healthy_heartpng.png"),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Healthy Heart is an integrated medical application that aims to predict coronary artery disease In addition to developing an integrated healthy diet of three duties In addition to providing the nearest doctor in your place with the possibility of communicating with each other through chatting with you.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                        strutStyle: StrutStyle(leading: 1),
                      ),
                      SizedBox(
                        height: 110,
                      ),
                      MainButton(
                        text: "Accept",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  MyAccountScreen()),
                          );
                        },
                      ),
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
