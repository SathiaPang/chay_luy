import 'package:flutter/material.dart';

const primeGreen = Color(0xff017F38);
const white = Colors.white;
const black = Colors.black;
const textColor = Color(0xffD8D8D8);

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle title = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
  );
  // Add more styles as needed
}

class WhiteText {
  static const TextStyle whiteTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: white,
  );
}
