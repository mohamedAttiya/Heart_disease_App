// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constant/colors.dart';
import 'package:graduation_project/view/registration/auth.dart';
import 'forget_password_main_page.dart';

class ForgetPasswordMailPage extends GetWidget<AuthViewModel> {

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(ForgetPasswordMainPage());
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
              SizedBox(
                height: 40,
              ),
              Container(
                height: size.height * 0.28,
                width: size.width,
                child: Image(
                  image: AssetImage('assets/email.png'),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  'Enter your email or your phone number, we will send you confirmation code',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: TextFormField(
                  controller: email,
                  cursorColor: mainColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Get.isDarkMode ? mainColor : Colors.grey.shade300,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: mainColor,
                      ),
                    ),
                    filled: true,
                    hintText: "name@example.com",
                    fillColor: Get.isDarkMode ? darkModeColor : Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: mainColor,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: Icon(Icons.email_rounded , color: mainColor,),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: GestureDetector(
                  onTap: () {
                    controller.sendPasswordResetEmail(email.text);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFF9F9F),
                    ),
                    child: Center(
                      child: Text(
                        'Reset Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Get.isDarkMode ? darkModeColor : whiteColor,
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
        ),
      ),
    );
  }
}
