import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/helper/binding.dart';
import 'package:graduation_project/helper/control_view.dart';
import 'package:graduation_project/theme/app_theme.dart';
import 'constant/colors.dart';
import 'custom_widget/no_internet_widget.dart';
import 'firebase_options.dart';
void main() async {
  //This two lines to connect the app with firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Heart Diseases',
      theme: MyThemes().lightTheme,
      darkTheme: MyThemes().darkTheme,
      themeMode: MyThemes().getThemeMode(),
      home: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return ControlView();
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