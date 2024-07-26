import 'package:flutter/material.dart';

class SuraTitleWidget extends StatelessWidget {
  final SuraData data;

  SuraTitleWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${data.suraNumber}',
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
            '${data.suraName}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

//data class
//علشان  نستدعيه ك فاريبول فوق وهو اساسا شايل اتين فاريبول
//ف هنعمل فاريبول من نوع SuraDataوهنسمه data
//   شايله اتنين فاريبول dataال

class SuraData {
  final String suraName;
  final String suraNumber;

  SuraData({required this.suraName, required this.suraNumber});
}
