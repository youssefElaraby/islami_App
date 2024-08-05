import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/colors_App.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/settings/language_bottom_sheet.dart';
import 'package:islami/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTap extends StatefulWidget {
  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showLanguageBottomSheet();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryLightColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          provider.applanguage == 'en'
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.arabic,
                          style: provider.isDarkMode()
                              ? Theme.of(context).textTheme.displaySmall
                              : Theme.of(context).textTheme.bodySmall),
                      Icon(Icons.arrow_drop_down, size: 30)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(AppLocalizations.of(context)!.theme,
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showThemeBottomSheet();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryLightColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          provider.applanguage == 'en'
                              ? AppLocalizations.of(context)!.light
                              : AppLocalizations.of(context)!.dark,
                          style: provider.isDarkMode()
                              ? Theme.of(context).textTheme.displaySmall
                              : Theme.of(context).textTheme.bodySmall),
                      Icon(Icons.arrow_drop_down, size: 30)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet() {
    //دي الرساله الهاتطلغلك من تححت
    //احنا هانروح نحط الميسود دي في اون تاب لما نضعط علي الكونتينر
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
