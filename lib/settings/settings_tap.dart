import 'package:flutter/material.dart';

class SettingsTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SettingsTap', style: Theme.of(context).textTheme.bodyLarge),
            Text('Comming Soon', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
