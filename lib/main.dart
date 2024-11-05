import 'package:chay_luy/domain/db/local.dart';
import 'package:chay_luy/firebase/firebase_options.dart';
import 'package:chay_luy/screens/Homescreen.dart';
import 'package:chay_luy/screens/onboarding/OnboardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final seenOnboard = await LocalDatabase.getData<bool>("seenOnboard");
  runApp(MainScreen(seenOnboard: seenOnboard));
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.seenOnboard});

  final bool? seenOnboard;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Pro",
      ),
      home: (seenOnboard == true) ? HomeScreen() : OnBoardingScreen(),
    );
  }
}
