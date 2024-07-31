import 'package:flutter/material.dart';
import 'package:islami/colors_App.dart';

class MyThemeData {
  //Light mode - Dark mode
  //object from MyThemeData
  static final ThemeData lightMode = ThemeData(
    primaryColor: AppColors.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      //دي بتخلي الاب بار شفاف بس بيكون فيه حتته غمقان
      backgroundColor: Colors.transparent,

      //دي بتشيل حته الغمقان الفي الاب بار
      elevation: 0,

      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 23,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryLightColor,
      selectedItemColor: AppColors.blackColor,
      //لو عايز اظهر كل الكلام التحت الصور الفيbottomNavigationBar
      // showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(
        size: 40,
      ),
      unselectedIconTheme: IconThemeData(
          // size: 25,
          ),
    ),
  );

  static final ThemeData darkMode = ThemeData(
    primaryColor: AppColors.primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 23,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDarkColor,
      selectedItemColor: AppColors.yellowColor,

      // showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(
        size: 40,
      ),
      unselectedIconTheme: IconThemeData(),
    ),
  );
}
