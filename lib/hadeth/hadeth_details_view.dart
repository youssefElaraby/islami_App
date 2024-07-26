import 'package:flutter/material.dart';
import 'package:islami/hadeth/hadeth_tap.dart';

class HadethDetailsView extends StatelessWidget {
  static const String routeName = 'HadethDetailsView';

  const HadethDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    //مسؤل عن ان الاسم ينبعت من اسكرينه ل اسكرينه اخري
    var receivedData = ModalRoute.of(context)?.settings.arguments as HadethData;
    //async
    //نوعها asyncعلشان هيا هتحمل وفي نفس الوقت الكومبيلر مش هايقف هياخد طريقين طريق التحميل بتاع الفنكشن دي
    //والكومبيلر هيمل بقيت الاسطر في نفس الوقت ال الفنكن دي بتحمل لسه

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
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06,
              vertical: MediaQuery.of(context).size.height * 0.05),
          padding: EdgeInsets.only(top: 30, bottom: 50, left: 30, right: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).primaryColor.withOpacity(0.3)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(receivedData.title,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).primaryColor,
              ),

              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      Text(receivedData.content[index]),
                  itemCount: receivedData.content.length,
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
}
