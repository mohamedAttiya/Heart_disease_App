// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:graduation_project/helper/ai_model.dart';
import 'package:graduation_project/view/have_no_risk.dart';

import '../constant/colors.dart';
import '../custom_widget/labelTextInTakeTest.dart';
import '../custom_widget/main_button.dart';
import '../custom_widget/no_internet_widget.dart';
import '../custom_widget/textfield_takeatest.dart';
import 'have_risk.dart';

class TakeAtest4Screen extends StatelessWidget {
  TakeAtest4Screen({
    super.key,
    required this.aiModel,
  }) : model = aiModel;

  final AIModel aiModel;

  AIModel model;
  bool isLoading = false;

  final _systolicBloodPressureController = TextEditingController();
  final _diastolicBloodPressureController = TextEditingController();
  final _glucoseController = TextEditingController();
  final _hdlCholesterol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Get.isDarkMode ? whiteColor : darkModeColor,
          ),
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
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          LabelTextInTakeTest(
                            text: 'Systolic blood pressure',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFieldTakeATest(
                            controller: _systolicBloodPressureController,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      child: Column(
                        children: [
                          LabelTextInTakeTest(
                            text: 'Diastolic blood pressure',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFieldTakeATest(
                            controller: _diastolicBloodPressureController,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      child: Column(
                        children: [
                          LabelTextInTakeTest(
                            text: 'Hdl Cholesterol',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFieldTakeATest(
                            controller: _hdlCholesterol,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      child: Column(
                        children: [
                          LabelTextInTakeTest(
                            text: 'Glucose Level',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFieldTakeATest(
                            controller: _glucoseController,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          StatefulBuilder(builder: (context, setState) {
                            return MainButton(
                              text: isLoading
                                  ? "Calculating..."
                                  : "Result of test",
                              onTap: () async {
                                model = model.copyWith(
                                  systolicBloodPressure: double.tryParse(
                                      _systolicBloodPressureController.text),
                                  diastolicBloodPressure: double.tryParse(
                                      _diastolicBloodPressureController.text),
                                  glucose:
                                      double.tryParse(_glucoseController.text),
                                  hdlCholesterol:
                                      double.tryParse(_hdlCholesterol.text),
                                );

                                if (model.systolicBloodPressure == null ||
                                    model.diastolicBloodPressure == null ||
                                    model.glucose == null ||
                                    model.hdlCholesterol == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('That information are required'),
                                    ),
                                  );
                                  return;
                                }
                                setState(() => isLoading = true);
                                final test = await model.test();
                                setState(() => isLoading = false);

                                if (test != null) {
                                  final data = jsonDecode(test);
                                  final result = data["predict_disease"][0];
                                  final risk = data['Risk'];
                                  if (result == 0) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HaveNoRiskScreen(risk),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HaveRiskScreen(risk),
                                      ),
                                    );
                                    print(aiModel.toJson());
                                  }
                                }
                                print(model.toJson());
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
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
