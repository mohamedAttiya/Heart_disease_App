// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/constant/colors.dart';

class MyThemes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: mainColor,
    backgroundColor: whiteColor,
    colorScheme: ColorScheme(
      primary: mainColor,
      onPrimary: mainColor,
      secondary: mainColor,
      onSecondary: mainColor,
      error: Colors.red,
      onError: Colors.red,
      background: whiteColor,
      onBackground: whiteColor,
      surface: whiteColor,
      onSurface: whiteColor,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(),
    dividerColor: Colors.black12,
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: darkModeColor,
    backgroundColor: darkModeColor,
    colorScheme: ColorScheme(
      primary: darkModeColor,
      onPrimary: darkModeColor,
      secondary: darkModeColor,
      onSecondary: darkModeColor,
      error: Colors.red,
      onError: Colors.red,
      background: darkModeColor,
      onBackground: darkModeColor,
      surface: darkModeColor,
      onSurface: darkModeColor,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(),
    dividerColor: Colors.white54,
  );

  final _getStorage = GetStorage();
  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSavedDarkMode());
  }
}
