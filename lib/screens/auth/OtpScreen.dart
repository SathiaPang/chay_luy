import 'package:chay_luy/assets/constants.dart';
import 'package:chay_luy/models/user/user.dart';
import 'package:chay_luy/screens/auth/NewPassword.dart';
import 'package:chay_luy/screens/components/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(
      {super.key, required this.changePassword, required this.data});

  final bool changePassword;
  final User data;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  void _onSubmit(String value) {
    print(value);
    if (value == "1111") {
      Get.to(
        () => NewPasswordScreen(
            changePassword: widget.changePassword, data: widget.data),
      );
    } else {
      showErrorDialog(context: context, message: "Wrong Code");
    }
  }

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
              Pinput(
                length: 4,
                onCompleted: _onSubmit,
                pinAnimationType: PinAnimationType.slide,
                focusedPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: primeGreen),
                  ),
                ),
              ),
              SizedBox(height: 32),
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
