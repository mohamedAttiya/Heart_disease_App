// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/healthylifestyletips_screen.dart';

import '../constant/colors.dart';
import '../custom_widget/list_tile_in_profile_screen.dart';
import '../custom_widget/no_internet_widget.dart';
import '../view_model/profile_view_model.dart';
import 'find_doctor.dart';
import 'my_account_screen.dart';
import 'take_atest_1_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) {
        if (controller.userModel != null) {
          _nameController.text = controller.userModel!.name!;
          _emailController.text = controller.userModel!.email!;
        }
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
                return SafeArea(
                  child: Container(
                    color: Get.isDarkMode ? darkModeColor : whiteColor,
                    child: Column(
                        children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
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
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.userModel!.name!,
                                    style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold,),
                                  ),
                                  Text(
                                    controller.userModel!.email!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 199, 197, 197),),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  MyAccountScreen(),),
                          );
                        },
                        child: ListTileInProfileScreen(
                          my_text: 'My account',
                          my_image: 'assets/myAccount_icon.png',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  TakeATest1Screen(),),
                          );
                        },
                        child: ListTileInProfileScreen(
                          my_text: 'Prediction',
                          my_image: 'assets/prediction_icon.png',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HealthyLifeStyleTipsScreen(),
                            ),
                          );
                        },
                        child: ListTileInProfileScreen(
                          my_text: 'Healthy Diet',
                          my_image: 'assets/healthyDiet_icon.png',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  FindDoctor(),),
                          );
                        },
                        child: ListTileInProfileScreen(
                          my_text: 'Doctors',
                          my_image: 'assets/doctor_icon.png',
                        ),
                      )
                    ]),
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
