import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/home/home_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, HomeScreen.routeName);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/splash.png');
  }
}
