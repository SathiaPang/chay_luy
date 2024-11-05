import 'package:chay_luy/assets/constants.dart';
import 'package:chay_luy/screens/auth/LoginScreen.dart';
import 'package:chay_luy/screens/settings/components/ProfileSection.dart';
import 'package:chay_luy/screens/settings/components/SettingItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          "Profile",
          style: TextStyle(
            color: white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: TextButton(
              onPressed: () => Get.offAll(() => LoginScreen()),
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.red[500],
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: primeGreen,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: primeGreen,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      backgroundColor: primeGreen,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: ProfileSection(),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadiusDirectional.vertical(
                      top: Radius.circular(24))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    SettingItem(
                      title: "My Account",
                      icon: Icons.person,
                      onClick: () {},
                    ),
                    SizedBox(height: 16),
                    SettingItem(
                      title: "Language",
                      icon: Icons.language,
                      onClick: () {},
                    ),
                    SizedBox(height: 16),
                    SettingItem(
                      title: "Contact Us",
                      icon: Icons.call,
                      onClick: () {},
                    ),
                    SizedBox(height: 16),
                    SettingItem(
                      title: "Term & Condition",
                      icon: Icons.library_books,
                      onClick: () {},
                    ),
                    SizedBox(height: 16),
                    SettingItem(
                      title: "Privay Policy",
                      icon: Icons.privacy_tip_outlined,
                      onClick: () {},
                    ),
                    SizedBox(height: 60)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
