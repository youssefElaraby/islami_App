import 'package:flutter/material.dart';
import 'package:islami/colors_App.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.17),
          child: Image.asset('assets/images/radio_image.png'),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Text(
          'إذاعه القرآن الكريم',
          style: TextStyle(fontSize: 28),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_previous,
                  color: provider.isDarkMode()
                      ? AppColors.yellowColor
                      : AppColors.primaryLightColor,
                  size: 50,
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.08,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow,
                  color: provider.isDarkMode()
                      ? AppColors.yellowColor
                      : AppColors.primaryLightColor,
                  size: 50,
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.08,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_next,
                  color: provider.isDarkMode()
                      ? AppColors.yellowColor
                      : AppColors.primaryLightColor,
                  size: 50,
                )),
          ],
        ),
      ],
    );
  }
}
