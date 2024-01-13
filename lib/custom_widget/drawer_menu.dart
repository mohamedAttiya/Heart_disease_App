import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constant/colors.dart';
import 'package:graduation_project/view/healthylifestyletips_screen.dart';
import '../view/find_doctor.dart';
import '../view/my_account_screen.dart';
import '../view/take_atest_1_screen.dart';
import '../view_model/profile_view_model.dart';
import 'list_tile_in_profile_screen.dart';

Widget drawerMenu(BuildContext context) {
  return GetBuilder<ProfileViewModel>(
    init: ProfileViewModel(),
    builder: (controller) {
      if (controller.userModel == null) {
        return Center(child: CircularProgressIndicator());
      }
      return Drawer(
        backgroundColor: context.theme.colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
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
                          color:
                          Get.isDarkMode ? whiteColor : darkModeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      controller.userModel!.email!,
                      style: TextStyle(
                          color: Get.isDarkMode
                              ? whiteColor
                              : darkModeColor),
                    )
                  ],
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccountScreen()),
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
                      builder: (context) => TakeATest1Screen(),
                    ),
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
                        builder: (context) =>
                            const HealthyLifeStyleTipsScreen()),
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
                    MaterialPageRoute(
                      builder: (context) => FindDoctor(),
                    ),
                  );
                },
                child: ListTileInProfileScreen(
                  my_text: 'Doctors',
                  my_image: 'assets/doctor_icon.png',
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
