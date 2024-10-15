import 'package:chay_luy/assets/constants.dart';
import 'package:chay_luy/screens/auth/NewPassword.dart';
import 'package:chay_luy/screens/auth/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/route_manager.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.changePassword});

  final bool changePassword;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  "Enter Verification Code",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Enter code that we have sent to your email",
              ),
              SizedBox(height: 32),
              OtpTextField(
                numberOfFields: 4,
                focusedBorderColor: primeGreen,
                showFieldAsBox: true,
                fieldWidth: 64,
                handleControllers: (value) {
                  code =
                      value.map((v) => v?.text).where((v) => v != null).join();
                },
              ),
              SizedBox(height: 32),
              CustomFormButton(
                text: "Submit",
                onClick: () {
                  Get.to(
                    () => NewPasswordScreen(changePassword: widget.changePassword),
                  );
                },
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Resend code",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
