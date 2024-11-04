import 'package:chay_luy/assets/constants.dart';
import 'package:flutter/material.dart';

class CustomFormButton extends StatelessWidget {
  const CustomFormButton(
      {super.key, required this.text, required this.onClick});

  final String text;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: FilledButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(primeGreen),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))))),
        onPressed: onClick,
        child: Text(text),
      ),
    );
  }
}
