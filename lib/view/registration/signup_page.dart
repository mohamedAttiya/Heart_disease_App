import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constant/colors.dart';
import 'package:graduation_project/view/registration/auth.dart';
import 'package:graduation_project/view/registration/login_page.dart';

import '../../custom_widget/no_internet_widget.dart';

class SignUpPage extends GetWidget<AuthViewModel> {
  SignUpPage({Key? key}) : super(key: key);

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
                              Get.to(LoginPage());
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
                            'Create New Account',
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
                            onSaved: (value) {
                              controller.name = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "name is empty";
                              }
                              return null;
                            },
                            cursorColor: mainColor,
                            decoration: InputDecoration(
                              hintText: "Name",
                              icon: Icon(
                                Icons.person,
                                color: mainColor,
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
                          child: TextFormField(
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
                                Icons.alternate_email_sharp,
                                color: mainColor,
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
                                  return "Password is too short";
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
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Obx(
                                      () => Checkbox(
                                        activeColor: Get.isDarkMode ? mainColor : mainColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    value: controller.isChecked.value,
                                    onChanged: (value) {
                                      controller.isChecked.value =
                                      !controller.isChecked.value;
                                    },
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'I agree to the mediocre ',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          'Terms of Service',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'and ',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          'Privacy Policy',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 40, top: 30),
                          child: GestureDetector(
                            onTap: () {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                controller.createAccountWithEmailAndPassword();
                              }
                            },
                            child: Obx( () => Container(
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFFF9F9F),
                                ),
                                child: controller.isLoading.value ? Center(child: CircularProgressIndicator(),) : Center(
                                  child: Text(
                                    'Sign Up',
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
                            Text("Join us before ? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
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
