import 'package:chay_luy/domain/repo/app_repo.dart';
import 'package:chay_luy/screens/auth/ForgetPasswordScreen.dart';
import 'package:chay_luy/screens/auth/RegisterScreen.dart';
import 'package:chay_luy/screens/auth/components/button.dart';
import 'package:chay_luy/screens/components/dialog.dart';
import 'package:chay_luy/screens/settings/SettingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final repo = AppRepo();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _submitSignin() async {
    final success =
        await repo.login(emailController.text, passwordController.text);
    if (success) {
      Get.offAll(Settingscreen());
    } else {
      showErrorDialog(context: context, message: "Login failed");
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  "Sign in with password",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
              SizedBox(height: 20),
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
              SizedBox(height: 32),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Get.to(() => ForgetPasswordScreen()),
                  child: Text(
                    "Forget password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              CustomFormButton(
                text: "Sign In",
                onClick: _submitSignin,
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account? ",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(() => RegisterScreen()),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ),
                  ],
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
