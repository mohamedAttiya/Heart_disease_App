import 'package:flutter/material.dart';
import 'package:graduation_project/helper/ai_model.dart';
class Tester extends StatefulWidget {
  const Tester({Key? key}) : super(key: key);
  @override
  State<Tester> createState() => _TesterState();
}
class _TesterState extends State<Tester> {
  AIModel aiModel = AIModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: ()async {
                  aiModel = aiModel.copyWith(
                    gender: 1,
                    age: 20,
                    isSmoking: 0,
                    cigarettes: 0,
                    bloodPressureMedTreatment: 0,
                    isHighBloodPressure: 0,
                    isDiabetes: 1,
                    totalCholesterol: 234.0,
                    hdlCholesterol: 96,
                    systolicBloodPressure: 120.5,
                    diastolicBloodPressure: 62.5,
                    glucose: 216,
                  );
                  print(aiModel.toJson());
                  print(aiModel.test());
                },
                child: Text(
                  "Test",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}