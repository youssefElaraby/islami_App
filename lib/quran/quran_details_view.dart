import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/quran/widget/sura_title_widget.dart';
import 'package:provider/provider.dart';

import '../colors_App.dart';
import '../providers/app_config_provider.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = 'QuranDetailsView';

  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    //مسؤل عن ان الاسم ينبعت من اسكرينه ل اسكرينه اخري
    var data = ModalRoute.of(context)?.settings.arguments as SuraData;

    //async
    //نوعها asyncعلشان هيا هتحمل وفي نفس الوقت الكومبيلر مش هايقف هياخد طريقين طريق التحميل بتاع الفنكشن دي
    //والكومبيلر هيمل بقيت الاسطر في نفس الوقت ال الفنكن دي بتحمل لسه
    if (content.isEmpty) {
      loadData(data.suraNumber);
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.isDarkMode()
              ? 'assets/images/dark_bg.png'
              : 'assets/images/background1x (1).png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'اسلامي',
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30, bottom: 50, left: 10, right: 10),
          padding: EdgeInsets.only(top: 30, bottom: 50, left: 30, right: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: provider.isDarkMode()
                  ? AppColors.primaryDarkColor.withOpacity(0.8)
                  : Theme.of(context).primaryColor.withOpacity(0.3)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('سوره ${data.suraName}',
                      style: TextStyle(
                          color: provider.isDarkMode()
                              ? AppColors.yellowColor
                              : AppColors.blackColor)),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.play_circle,
                    color: provider.isDarkMode()
                        ? AppColors.yellowColor
                        : AppColors.blackColor,
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: provider.isDarkMode()
                    ? AppColors.yellowColor
                    : AppColors.primaryLightColor,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    "${{index + 1}}${versesList[index]}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  itemCount: versesList.length,
                ),
              ),

              // Text(content,
              // textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  //دي الفنكشن البتجيت الداتا من داخل الفايل
  String content = '';
  List<String> versesList = [];

  loadData(String suraNumber) async {
    //Future<String>
    content = await rootBundle.loadString('assets/files/sura/$suraNumber.txt');
    versesList = content.split('\n');
    setState(() {});
    print(content);
  }
}
