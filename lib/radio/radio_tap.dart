import 'package:flutter/material.dart';

class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Radio', style: Theme.of(context).textTheme.bodyLarge),
            Text('Comming Soon', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
