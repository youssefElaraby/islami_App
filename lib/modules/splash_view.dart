import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Image.asset(provider.isDarkMode()
        ? 'assets/images/splash – dark- 1.png'
        : 'assets/images/splash.png');
  }
}
