import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/colors_App.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    //دي طريقه معينه علشان نكريت provider
    var provider = Provider.of<AppConfigProvider>(context);
    //عملنا الحته دي علشا نعرف نأكسس الفاريبول الجوهAppConfigProvider
    //عن طريق   ==>    locale: Locale(provider.applanguage),

    return Container(
      color: AppColors.primaryLightColor.withOpacity(0.15),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  //changeLanguageدي ميسود داخل كلاس AppConfigProvider
                  provider.changeLanguage('en');
                },
                child: provider.applanguage == 'en'
                    ? getSelectedItemWidget(
                        AppLocalizations.of(context)!.english)
                    : getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.english)),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  //changeLanguageدي ميسود داخل كلاس AppConfigProvider
                  provider.changeLanguage('ar');
                },
                child: provider.applanguage == 'ar'
                    ? getSelectedItemWidget(
                        AppLocalizations.of(context)!.arabic)
                    : getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.arabic)),
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
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.primaryLightColor),
        ),
        Icon(
          Icons.check,
          size: 25,
          color: AppColors.primaryLightColor,
        )
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
