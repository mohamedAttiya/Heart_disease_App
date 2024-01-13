import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AIModel {
  int? gender;
  int? age;
  int? cigarettes;
  int? isSmoking;
  int? isHighBloodPressure;
  int? isDiabetes;
  int? bloodPressureMedTreatment;
  double? totalCholesterol;
  double? systolicBloodPressure;
  double? diastolicBloodPressure;
  double? glucose;
  double? hdlCholesterol;

  AIModel({
    this.gender,
    this.age,
    this.cigarettes,
    this.isHighBloodPressure,
    this.isSmoking,
    this.isDiabetes,
    this.bloodPressureMedTreatment,
    this.totalCholesterol,
    this.systolicBloodPressure,
    this.diastolicBloodPressure,
    this.glucose,
    this.hdlCholesterol,
  });

  Future<String?> test() async {
    var uri = Uri.parse('https://healty-heart-risk.onrender.com/predictAPI');
    final body = jsonEncode(toJson());

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Values sent successfully');
        print(response.body);
      }
      return response.body;
    } else {
      if (kDebugMode) {
        print(
            'Sending data has failed with status code ${response.statusCode}');
      }
      return null;
    }
  }

  AIModel copyWith({
    int? gender,
    int? age,
    int? cigarettes,
    int? isSmoking,
    int? isHighBloodPressure,
    int? isDiabetes,
    int? bloodPressureMedTreatment,
    double? totalCholesterol,
    double? systolicBloodPressure,
    double? diastolicBloodPressure,
    double? glucose,
    double? hdlCholesterol,
  }) {
    return AIModel(
      gender: gender ?? this.gender,
      age: age ?? this.age,
      cigarettes: cigarettes ?? this.cigarettes,
      isHighBloodPressure: isHighBloodPressure ?? this.isHighBloodPressure,
      isDiabetes: isDiabetes ?? this.isDiabetes,
      bloodPressureMedTreatment:
          bloodPressureMedTreatment ?? this.bloodPressureMedTreatment,
      totalCholesterol: totalCholesterol ?? this.totalCholesterol,
      systolicBloodPressure:
          systolicBloodPressure ?? this.systolicBloodPressure,
      diastolicBloodPressure:
          diastolicBloodPressure ?? this.diastolicBloodPressure,
      glucose: glucose ?? this.glucose,
      isSmoking: isSmoking ?? this.isSmoking,
      hdlCholesterol: hdlCholesterol ?? this.hdlCholesterol,
    );
  }

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'age': age,
        'smoker': isSmoking,
        'cigarettes': cigarettes,
        'is_high_blood_pressure': isHighBloodPressure,
        'is_diabetes': isDiabetes,
        'blood_pressure_med_treatment': bloodPressureMedTreatment,
        'total_cholesterol': totalCholesterol,
        'systolic_blood_pressure': systolicBloodPressure,
        'Diastolic_b_p': diastolicBloodPressure,
        'glucose': glucose,
        'hdl_cholesterol': hdlCholesterol,
      };
}
