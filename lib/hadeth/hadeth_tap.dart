import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth/widget/item_hadeth_name_bottom.dart';
import 'package:provider/provider.dart';

import '../colors_App.dart';
import '../providers/app_config_provider.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<HadethData> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    if (ahadethList.isEmpty) {
      loadHadethFile();
    }

    return Container(
      child: Column(
        children: [
          Image.asset('assets/images/hadith_header.png'),
          Divider(
            color: provider.isDarkMode()
                ? AppColors.yellowColor
                : AppColors.primaryLightColor,
            thickness: 3,
          ),
          Text('الاحاديث', style: Theme.of(context).textTheme.bodyMedium),
          Divider(
            color: provider.isDarkMode()
                ? AppColors.yellowColor
                : AppColors.primaryLightColor,
            thickness: 3,
          ),
          Expanded(
            child: ahadethList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryLightColor,
                    ),
                  )
                : Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.9, // Adjust the width as needed,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 2,
                            color: provider.isDarkMode()
                                ? AppColors.yellowColor
                                : AppColors.primaryLightColor,
                          );
                        },
                        itemBuilder: (context, index) {
                          return ItemHadethName(
                            hadeth: ahadethList[index],
                          );
                        },
                        itemCount: ahadethList.length,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  //دا الفاريبول الهانستقبل فيه كل الاحاديث ال في الفايل
  String hadethContact = '';

  //دي ليست علشان نخزن فيها الحديث الواحد
  List<String> hadethList = [];

  //دي الليست الهانخزن فيها السطر الواحد علشان نستعمل الاندكس
  List<String> hadethLines = [];

//*************************************************************************
  void loadHadethFile() async {
    //بنقرء فايل عن طريقrootBundle.loadString
    hadethContact =
        await rootBundle.loadString('assets/files/hadeth/ahadeth.txt');
    //--------------------------------------
    //كدا احنا فصلنا كل حديث عن التاني وخزناهم في الليسته دي
    //اللسته دي هايبقا فيها خمسيت حديث كل حديث لوحدو
    //الحديث الواحد هايبقا عباره عن اندكس
    hadethList = hadethContact.split('#\r\n');
    //--------------------------------------
    //عايزين بقا نمسك الحديث الواحد نفصلو ب السطور
    //الحديث الواحد هايبقا ب النسبه ليناhadthList[i]
    for (int i = 0; i < hadethList.length; i++) {
      //هنا بتقولو افصلي كل سطر عن التانيhadthList[i].split('\n');
      //وخزنه فيhadthLines اللسته دي فييها الحديث الواحد متخزن سطور
      hadethLines = hadethList[i].split('\n');
      //كدا قولنالو خزن اول سطر في الاسترنج داtitleOnce
      String title = hadethLines[0];
      //ثم نقوم بحزف اول سطر في الحديث
      hadethLines.removeAt(0);

      HadethData hadeth = HadethData(title: title, content: hadethLines);
      //هنضيف في الليسته كل الراجع من الاوبجكت hadeth
      ahadethList.add(hadeth);

      setState(() {});
    }
  }
}

//data class
//علشان  نستدعيه ك فاريبول فوق وهو اساسا شايل اتين فاريبول
//ف هنعمل فاريبول من نوع SuraDataوهنسمه data
//   شايله اتنين فاريبول dataال

class HadethData {
  final String title;
  final List<String> content;

  HadethData({required this.title, required this.content});
}
