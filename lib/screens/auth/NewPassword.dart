import 'package:chay_luy/screens/auth/components/button.dart';
import 'package:chay_luy/screens/components/SuccessScreen.dart';
import 'package:chay_luy/screens/settings/SettingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key, required this.changePassword});

  final bool changePassword;

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
                  "Create Password",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Create your new password to login",
              ),
              SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              SizedBox(height: 32),
              CustomFormButton(
                text: "Confirm",
                onClick: () => Get.to(
                  () => SuccessScreen(
                    title: widget.changePassword
                        ? "Password Changed"
                        : "Congratulations",
                    message: widget.changePassword
                        ? "Your password has been changed successfully."
                        : "Your account is ready to use. You now can go to home page.",
                    buttonLabel: "Finish",
                    onDone: () {
                      Get.offAll(Settingscreen());
                    },
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
