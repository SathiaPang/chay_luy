import 'package:chay_luy/models/user/user.dart';
import 'package:chay_luy/screens/auth/OtpScreen.dart';
import 'package:chay_luy/screens/auth/components/button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();

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
                  "Forget Your Password?",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                "No worries, you just need to type your email address and we will send the verification code",
              ),
              SizedBox(height: 32),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 32),
              CustomFormButton(
                text: "Send code",
                onClick: () =>
                    Get.to(() => OtpScreen(changePassword: true, data: User(email: emailController.text))),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
