// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/registration/auth.dart';

import '../../constant/colors.dart';
import '../../custom_widget/no_internet_widget.dart';
import 'forget_password_page/forget_password_main_page.dart';
import 'register_page.dart';
import 'signup_page.dart';

class LoginPage extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      body: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                          left: 10,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.to(RegisterPage());
                          },
                          icon: Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                      Container(
                        height: size.height * 0.3,
                        width: size.width,
                        child: Image(
                          image: AssetImage('assets/login.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          'Login to Your Account',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 40, left: 25),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {
                            controller.email = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "email is empty";
                            }
                            return null;
                          },
                          cursorColor: mainColor,
                          decoration: InputDecoration(
                            hintText: "Email",
                            icon: Icon(
                              Icons.alternate_email_sharp, color: mainColor,
                            ),
                            focusColor: mainColor,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: mainColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 40, left: 25, top: 20),
                        child: Obx(
                              () => TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            onSaved: (value) {
                              controller.password = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is Not Valid";
                              }
                              return null;
                            },
                            cursorColor: mainColor,
                            obscureText: controller.isPasswordHidden.value,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.isPasswordHidden.value =
                                  !controller.isPasswordHidden.value;
                                },
                                child: Icon(
                                  controller.isPasswordHidden.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: mainColor,
                                ),
                              ),
                              hintText: "Password",
                              icon: Icon(
                                Icons.lock,
                                color: mainColor,
                              ),
                              focusColor: mainColor,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: mainColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 180),
                        child: TextButton(
                          onPressed: () {
                            Get.to(ForgetPasswordMainPage());
                          },
                          child: Text(
                            'Forget the password ?',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: GestureDetector(
                          onTap: () {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              controller.signInWithEmailAndPassword();
                            }
                          },
                          child: Obx( () => Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFFF9F9F),
                              ),
                              child: controller.isLoading.value ? Center(child: CircularProgressIndicator(
                                color: whiteColor,
                              ),) : Center(
                                child: Text(
                                  'Login',
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => SignUpPage());
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  color: mainColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10, left: 40),
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                          ),
                          Text(
                            "or continue with",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 40, left: 10),
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10),
                            ),
                            onPressed: () {
                              controller.googleSignInMethod();
                            },
                            child: Image(
                              image: AssetImage('assets/google.png'),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          OutlinedButton(
                            onPressed: () {
                              controller.signInWithFacebook();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10),
                            ),
                            child: Image(
                              image: AssetImage('assets/facebook.png'),
                            ),
                          ),
                        ],
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
