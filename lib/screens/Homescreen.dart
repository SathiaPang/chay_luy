import 'package:chay_luy/assets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primeGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Container(
                height: Get.height * 0.2,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: primeGreen,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SvgPicture.asset(
                  'lib/assets/images/Pattern-1.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
