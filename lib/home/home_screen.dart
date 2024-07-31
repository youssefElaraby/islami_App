import 'package:flutter/material.dart';
import 'package:islami/hadeth/hadeth_tap.dart';
import 'package:islami/quran/quran_tap.dart';
import 'package:islami/sepha/sepha_tap.dart';
import 'package:islami/settings/settings_tap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../radio/radio_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background1x (1).png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          //هنا اي حاجه هتتحط  في الاسكافولد(الاسكرين) هتبقا شفافه
          // backgroundColor: Colors.transparent,

          appBar: AppBar(
            elevation: 0,
            title: Text(
              AppLocalizations.of(context)!.app_title,
              //دي علشان لما اجي اخد Themeمن فايل تاني
              //علشان الاستيل بدل ما افضل اكررر
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),

          bottomNavigationBar: Theme(
            //دي علشان لوBottomNavigationBar مارداش ياخد لون الباك جراوند
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              //دا بتاع لما اجيselectايكون فيBottomNavigationBar
              //بيلون ال انتا اخترته وينقلك ل حاجه انتا بتحددها
              //لو حطيت مكانselectedIndex رقم ترتيب الرقم دا في الايكون هو ال ها يتلون
              //بس ماينفعش احنا النحدد الuser هو البيختار وهة بيتلون علي اختياره دا
              //selectedIndex<==دا فاريبول احنا عاملينو
              //الفاريبول دا هو الهاياخد المكان الuser هايضغط علي ب الاندكس
              currentIndex: selectedIndex,
              //onTapعباره عن كول باك فنكشن هترجعلك رقم من نوع انتجر الرقم دا هو الاندكس
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },

              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/quran.png')),
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(
                        'assets/images/quran-quran-svgrepo-com.png')),
                  label: AppLocalizations.of(context)!.hadeth,
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/sebha_blue.png')),
                    label: AppLocalizations.of(context)!.sepha),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/radio.png')),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),

          //   اختيار لسته tabsبناء علي الهايختاره الuser
          //الهو selectedIndex
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTap(),
    HadethTap(),
    SephaTap(),
    RadioTap(),
    SettingsTap(),
  ];
}
