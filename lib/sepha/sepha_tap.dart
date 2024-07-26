import 'package:flutter/material.dart';
import 'package:islami/colors_App.dart';

class SephaTap extends StatefulWidget {
  @override
  State<SephaTap> createState() => _SephaTapState();
}

class _SephaTapState extends State<SephaTap> {
  int counter = 0;

  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لااله الا الله",
    "الله اكبر"
  ];
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset('assets/images/head of seb7a.png'),
                // SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Transform.rotate(
                    angle: angle,
                    child: InkWell(
                      onTap: () {
                        clickOnImage();
                        angle += 3.14 / 4;

                        setState(() {});
                      },
                      child: Image.asset('assets/images/body of seb7a-1.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text('عدد التسبيحات '),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: AppColors.primaryLightColor,
                ),
                // height: 95,
                width: screenWidth * 0.3,
                child: Center(child: Text('$counter')),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: AppColors.primaryLightColor,
                ),
                // height: 95,
                width: screenWidth * 0.6,
                child: Center(child: Text('${azkar[index]}')),
              ),
            ),
          ),
        ],
      ),
    );
  }

  incrementCount() {
    setState(() {
      counter++;
    });
  }

  clickOnImage() {
    counter++;
    //دي علشان لما الكونتر يجيب33يزود ال indexواحد
    if (counter % 33 == 0) {
      index++;
    }
    //دي علشان لما يخلص الليست ال هما اربع ازكار
    //يرجه تاني يجيب من اول زكر ويخلي الكونتر ب 0
    if (azkar.length == index) {
      index = 0;
      counter = 0;
    }
    //دي علشان لما الكونتر يجيب 33 يرجع 0تاني
    if (counter == 33) {
      counter = 0;
    }
  }
}
