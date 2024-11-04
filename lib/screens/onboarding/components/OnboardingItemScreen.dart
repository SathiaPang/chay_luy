import 'package:flutter/material.dart';

class OnboardingItemScreen extends StatelessWidget {
  const OnboardingItemScreen(
      {super.key, required this.iconPath, required this.title});
  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(iconPath),
        SizedBox(height: 32),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
