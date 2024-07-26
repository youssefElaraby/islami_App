import 'package:flutter/material.dart';
import 'package:islami/hadeth/hadeth_details_view.dart';
import 'package:islami/hadeth/hadeth_tap.dart';

class ItemHadethName extends StatelessWidget {
  HadethData hadeth;

  ItemHadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsView.routeName, arguments: hadeth);
      },
      child: Text(hadeth.title),
    );
  }
}
