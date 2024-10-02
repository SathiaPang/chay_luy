import 'package:chay_luy/assets/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primeGreen,
        title: Text(
          "hello how are you?",
          style: TextStyle(color: white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Hello, how are you!!")],
        ),
      ),
    );
  }
}
