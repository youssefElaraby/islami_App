import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/colors_App.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      color: AppColors.primaryLightColor.withOpacity(0.15),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                //Change Theme  Mode To Dark
                provider.changeTheme(ThemeMode.dark);
              },
              //لو ال darkهوSelected
              child: provider.isDarkMode()
                  //روح نفذ دي
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                  //غير كدا نفذ دي
                  : getUnSelectedItemWidget(AppLocalizations.of(context)!.dark),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                //Change Theme  Mode To Dark

                provider.changeTheme(ThemeMode.light);
              },
              child: !(provider.isDarkMode())
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.light)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.light),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.yellowColor,
              ),
        ),
        Icon(
          Icons.check,
          size: 25,
          color: AppColors.yellowColor,
        ),
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
