import 'package:chay_luy/domain/repo/app_repo.dart';
import 'package:chay_luy/ext/string.dart';
import 'package:chay_luy/models/user/user.dart';
import 'package:chay_luy/screens/auth/components/button.dart';
import 'package:chay_luy/screens/components/SuccessScreen.dart';
import 'package:chay_luy/screens/components/dialog.dart';
import 'package:chay_luy/screens/settings/SettingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen(
      {super.key, required this.changePassword, required this.data});

  final bool changePassword;
  final User data;

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final repo = AppRepo();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _onConfirm() async {
    final pw = passwordController.text;
    final confPw = confirmPasswordController.text;

    if (pw != confPw) {
      showErrorDialog(
        context: context,
        message: "Password and Confirm Password are not the same",
      );
      return;
    }

    if (!widget.changePassword) {
      final result =
          await repo.signup(widget.data.copyWith(password: pw.hashPassword()));
      if (result)
        Get.to(
          () => SuccessScreen(
            title:
                widget.changePassword ? "Password Changed" : "Congratulations",
            message: widget.changePassword
                ? "Your password has been changed successfully."
                : "Your account is ready to use. You now can go to home page.",
            buttonLabel: "Finish",
            onDone: () {
              Get.offAll(Settingscreen());
            },
          ),
        );
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
                controller: passwordController,
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
                controller: confirmPasswordController,
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
                onClick: _onConfirm,
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
