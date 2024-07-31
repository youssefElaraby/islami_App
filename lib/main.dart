import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeth/hadeth_details_view.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/modules/splash_view.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quran/quran_details_view.dart';
import 'package:provider/provider.dart';

import 'my_theme_data.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => AppConfigProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranDetailsView.routeName: (context) => const QuranDetailsView(),
        HadethDetailsView.routeName: (context) => const HadethDetailsView(),
      },
      theme: MyThemeData.lightMode,
      darkTheme: MyThemeData.darkMode,
      themeMode: provider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.applanguage),
    );
  }
}
