// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constant/colors.dart';
import 'package:graduation_project/view/edit_profile_screen.dart';
import '../custom_widget/list_tile_in_my_account_screen.dart';
import '../custom_widget/no_internet_widget.dart';
import '../view_model/profile_view_model.dart';
import 'about_screen.dart';
import 'privacy_policy_screen.dart';
import 'profile_sceen.dart';
import 'registration/auth.dart';
import 'registration/login_page.dart';

class MyAccountScreen extends GetWidget<AuthViewModel> {
   MyAccountScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              icon: Icon(Icons.arrow_back_ios),
              color: Get.isDarkMode ?whiteColor : darkModeColor,
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (controller.userModel!.pic != null &&
                                    controller.userModel!.pic!.isNotEmpty) ...[
                                  ClipOval(
                                    child: Image.network(
                                      controller.userModel!.pic!,
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ] else ...[
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/unpicked_image.jpg',
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.userModel!.name!,
                                    style: TextStyle(
                                      color: Get.isDarkMode ? whiteColor : darkModeColor,
                                      fontWeight: FontWeight.bold,),),
                                ),
                                Text(
                                  controller.userModel!.email!,
                                  style: TextStyle(color: Get.isDarkMode ? whiteColor : darkModeColor),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 400,
                                  child: ListView(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => EditProfileScreen(),
                                            ),
                                          );
                                        },
                                        child: ListTileInMyAccountScreen(
                                          image: 'assets/edit_profile.png',
                                          textTitle: 'Edit Profile',
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const AboutScreen(),
                                            ),
                                          );
                                        },
                                        child: ListTileInMyAccountScreen(
                                          image: 'assets/about.png',
                                          textTitle: 'About',
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                              const PrivacyPolicyScreen(),
                                            ),
                                          );
                                        },
                                        child: ListTileInMyAccountScreen(
                                          image: 'assets/privacy_policy.png',
                                          textTitle: 'Privacy Policy',
                                        ),
                                      ),
                                      Obx(
                                        () => InkWell(
                                          onTap: () async {
                                            await controller.signOut();
                                            Get.offAll(LoginPage());
                                          },
                                          child: controller.isLoading.value
                                              ? CircularProgressIndicator()
                                              :ListTileInMyAccountScreen(
                                            image: 'assets/logout.png',
                                            textTitle: 'Logout',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
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
      },
    );
  }
}
