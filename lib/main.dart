import 'package:chay_luy/assets/constants.dart';
import 'package:chay_luy/screens/onboarding/OnboardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: primeGreen)),
      home: OnBoardingScreen(),
    );
  }
}
