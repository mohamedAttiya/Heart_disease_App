// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constant/colors.dart';
import 'package:graduation_project/view/registration/auth.dart';
import 'package:graduation_project/view/registration/forget_password_page/forget_password_mail_page.dart';
import 'package:graduation_project/view/registration/login_page.dart';

class ForgetPasswordMainPage extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(() => LoginPage());
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  'Forget Password',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Container(
              height: size.height * 0.3,
              width: size.width,
              child: Image(
                image: AssetImage('assets/forget-password.png'),
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25 , right: 25),
              child: Text(
                'Select which contact details should we use to reset your  password',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => ForgetPasswordMailPage());
              },
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 80),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.12,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: mainColor,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.email_rounded,
                        size: 40,
                        color: mainColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "E-Mail",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Reset Via E-Mail Verification",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
