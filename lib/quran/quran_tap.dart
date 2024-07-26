import 'package:flutter/material.dart';
import 'package:islami/colors_App.dart';
import 'package:islami/quran/quran_details_view.dart';

import 'widget/sura_title_widget.dart';

class QuranTap extends StatelessWidget {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Image.asset('assets/images/Screenshot (1).png'),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 3,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'عدد الآيات',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              width: 3,
              height: 50,
            ),
            Expanded(
              child: Text(
                'اسم الصوره',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context, QuranDetailsView.routeName,
                  //دي الهنبعت بيها معلومات من اسكرينه ل اخري
                  //لما نضغط علي اي اسم سوره يعمل نافيجيت ل الاسكرينه الاخري
                  //هنروه بقا نستقبلها في الصفحه الاحنا عايزنها
                  //هنا عايزين الصفحه QuranDetailsView
                  arguments: SuraData(
                      suraName: suraNames[index],
                      suraNumber: (index + 1).toString()),
                );
              },
              child: SuraTitleWidget(
                data: SuraData(
                    suraName: suraNames[index],
                    suraNumber: (index + 1).toString()),
              ),
            ),
            itemCount: suraNames.length,
          ),
        )
      ]),
    );
  }
}
