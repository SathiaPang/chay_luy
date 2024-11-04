import 'dart:io';

import 'package:chay_luy/models/user/user.dart';
import 'package:chay_luy/screens/auth/OtpScreen.dart';
import 'package:chay_luy/screens/auth/components/button.dart';
import 'package:chay_luy/screens/auth/components/ProfileAvatar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenumberController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  //Show options to get image from camera or gallery
  Future showPhotoPicker() async {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Photo Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                getImageFromGallery();
              },
            ),
            ListTile(
              title: Text('Camera'),
              onTap: () {
                Navigator.of(context).pop();
                getImageFromCamera();
              },
            ),
            SizedBox(height: 80)
          ],
        );
      },
    );
  }

  void _onContinueRegister() {
    final data = User(
      firstname: firstnameController.text,
      lastname: lastnameController.text,
      email: emailController.text,
      phonenumber: phonenumberController.text
    );
    Get.to(() => OtpScreen(changePassword: false, data: data));
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
                  "Fill Your Profile",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text("Don't worry. You can always change it later"),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.center,
                child: ProfileAvater(
                  imageUrl: null,
                  localImage: _image,
                  onClick: showPhotoPicker,
                ),
              ),
              SizedBox(height: 32),
              TextFormField(
                controller: firstnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Firstname',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: lastnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Lastname',
                ),
              ),
              SizedBox(height: 16),
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
                controller: phonenumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone number',
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 32),
              CustomFormButton(
                text: "Continue",
                onClick: _onContinueRegister,
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
