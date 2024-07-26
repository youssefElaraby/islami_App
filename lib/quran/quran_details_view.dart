import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/quran/widget/sura_title_widget.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = 'QuranDetailsView';

  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  @override
  Widget build(BuildContext context) {
    //مسؤل عن ان الاسم ينبعت من اسكرينه ل اسكرينه اخري
    var data = ModalRoute.of(context)?.settings.arguments as SuraData;

    //async
    //نوعها asyncعلشان هيا هتحمل وفي نفس الوقت الكومبيلر مش هايقف هياخد طريقين طريق التحميل بتاع الفنكشن دي
    //والكومبيلر هيمل بقيت الاسطر في نفس الوقت ال الفنكن دي بتحمل لسه
    if (content.isEmpty) {
      loadData(data.suraNumber);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background1x (1).png'),
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
              color: Theme.of(context).primaryColor.withOpacity(0.3)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('سوره ${data.suraName}',
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(width: 10),
                  Icon(Icons.play_circle),
                ],
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).primaryColor,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                      "${{index + 1}}${versesList[index]}",
                      textAlign: TextAlign.center),
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
