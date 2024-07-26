import 'package:flutter/material.dart';
import 'package:islami/hadeth/hadeth_details_view.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/modules/splash_view.dart';
import 'package:islami/quran/quran_details_view.dart';

import 'my_theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranDetailsView.routeName: (context) => const QuranDetailsView(),
        HadethDetailsView.routeName: (context) => const HadethDetailsView(),
      },
      //هنا ثبتانا الباك جراوند للاسكافولد
      //وباك جراوتند بتاع الاب بار و الايلفيشن
      //للتطبيق كلو مره واحده
      theme: MyThemeData.lightMode,
    );
  }
}
