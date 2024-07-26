import 'package:flutter/material.dart';

class SephaTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: screenHeight * 0.055,
            child: Image.asset(
              'assets/images/head of seb7a.png',
              width: screenWidth * 0.17, // Use a percentage of screen width
            ),
          ),
          Positioned(
            top: screenWidth * 0.19,
            child: Image.asset(
              'assets/images/body of seb7a-1.png',
              width: screenWidth * 0.81, // Use a percentage of screen width
            ),
          ),
        ],
      ),
    );
  }
}
