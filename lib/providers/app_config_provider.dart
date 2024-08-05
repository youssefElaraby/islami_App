import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String applanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    print("Changing theme to: $newLanguage");

    if (applanguage == newLanguage) {
      return;
    }
    applanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    print("Changing theme to: $newMode");
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
