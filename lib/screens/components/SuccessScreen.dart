import 'package:chay_luy/assets/constants.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      this.title,
      this.message,
      this.onDone,
      this.buttonLabel,
      this.iconPath});

  final String? title;
  final String? message;
  final void Function()? onDone;
  final String? buttonLabel;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    iconPath ?? 'lib/assets/icons/ic_success.png',
                    width: 120,
                  ),
                  SizedBox(height: 16),
                  Text(
                    title ?? "Success",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  if (message != null)
                    Text(
                      message!,
                      textAlign: TextAlign.center,
                    ),
                  SizedBox(height: 70),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(primeGreen),
                ),
                onPressed: onDone,
                child: Text(buttonLabel ?? 'Done'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
