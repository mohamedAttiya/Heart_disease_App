// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../custom_widget/main_button.dart';
import '../custom_widget/no_internet_widget.dart';
import 'my_account_screen.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Privacy Policy",
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
                padding: EdgeInsets.only(top: 20, right: 20 , left: 15),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "This Privacy Policy describes how Medical Information Technology, Inc.'s (“Healthy Heart”) mobile application (the “Healthy Heart”) uses and transmits information and data. By using the Healthy Heart Application, you consent to this Privacy Policy and the terms herein. Healthy Heart may change this Privacy Policy from time to time. It is your responsibility to check this webpage periodically to see if any terms have been changed or modified. Your continued use of the Healthy Heart Application constitutes your acceptance of any updates to this Privacy Policy.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        strutStyle: StrutStyle(leading: 0.4),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "In order to use the Healthy Heart App, you must have an account with a healthcare institution that uses Healthy Heart software. The Healthy Heart Application connects with systems operated and maintained by said health care institutions. The Healthy Heart Application does not receive or collect any data or information directly from your device.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        strutStyle: StrutStyle(leading: 0.4),
                      ),
                      SizedBox(
                        height: 70,
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
