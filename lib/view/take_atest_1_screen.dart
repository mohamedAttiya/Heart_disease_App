// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:graduation_project/helper/ai_model.dart';

import '../constant/colors.dart';
import '../custom_widget/main_button.dart';
import '../custom_widget/no_internet_widget.dart';
import '../custom_widget/test_with_yes_or_no.dart';
import '../custom_widget/textfield_takeatest.dart';
import 'take_atest_2_screen.dart';

class TakeATest1Screen extends StatelessWidget {
  TakeATest1Screen({super.key});

  final _cigarettesController = TextEditingController();
  AIModel aiModel = AIModel();

  int isSmoking = 1;
  int isHighBloodP = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        elevation: 0.0,
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.only(left: 15, right: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome to Healthy Heart",
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Please tell us some basic information \nto complete the test ",
                              style: TextStyle(
                                color: lightBlackColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TestWithYesOrNo(
                        text: 'Do you smoke?',
                        onChanged: (value) {
                          isSmoking = value;
                          aiModel = aiModel.copyWith(
                            isSmoking: value,
                          );
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 15, right: 10, bottom: 10),
                        child: Column(
                          children: [
                            Text(
                              "The average number of cigarettes you smoke in a day.",
                              style: TextStyle(
                                  color: lightBlackColor, fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFieldTakeATest(
                              controller: _cigarettesController,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TestWithYesOrNo(
                        text: 'Are you taking blood pressure medication?',
                        onChanged: (value) {
                          isHighBloodP = value;
                          aiModel = aiModel.copyWith(
                            isHighBloodPressure: value,
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: MainButton(
                            text: "Next",
                            onTap: () {
                              aiModel = aiModel.copyWith(
                                cigarettes: int.tryParse(
                                      _cigarettesController.text,
                                    ) ??
                                    0,
                                isSmoking: isSmoking,
                                isHighBloodPressure: isHighBloodP,
                              );
                              if (aiModel.isSmoking == 1) {
                                if (aiModel.cigarettes == 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.grey,
                                      content:
                                          Text('No of cigarettes is required and cannot be 0'),
                                    ),
                                  );
                                  return;
                                }
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TakeATest2Screen(aiModel: aiModel),
                                ),
                              );
                            }),
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
