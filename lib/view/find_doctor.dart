// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:graduation_project/custom_widget/doctor_item.dart';
import 'package:graduation_project/helper/doctor_data.dart';
import 'package:graduation_project/model/doctor_model.dart';

import '../constant/colors.dart';
import '../custom_widget/no_internet_widget.dart';

class FindDoctor extends StatefulWidget {
  @override
  State<FindDoctor> createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  List<DoctorModel> doctors = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    doctors = getDoctors();
    setState(() {
      _loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        elevation: 0.0,
        title: Text(
          "Doctors",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Get.isDarkMode ? whiteColor : darkModeColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Get.isDarkMode ? whiteColor : darkModeColor,
          ),
          onPressed: () {
            Navigator.pop(context);
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
            return Container(
              child: ListView.builder(
                itemCount: doctors.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return DoctorItem(
                    name: doctors[index].name,
                    imageUrl: doctors[index].imageUrl,
                    address: doctors[index].address,
                    specialize: doctors[index].Specialization,
                  );
                },
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
