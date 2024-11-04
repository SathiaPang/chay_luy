import 'package:chay_luy/assets/constants.dart';
import 'package:chay_luy/models/OnboardingItem.dart';
import 'package:chay_luy/screens/auth/LoginScreen.dart';
import 'package:chay_luy/screens/onboarding/components/OnboardingItemScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});
  final List<Onboardingitem> boardingItem = [
    Onboardingitem(
      iconPath: 'lib/assets/icons/onboarding_pic1.png',
      title: 'Trusted by millions of people, part of one part',
    ),
    Onboardingitem(
      iconPath: 'lib/assets/icons/onboarding_pic2.png',
      title: 'Spend money abroad, and track your expense',
    ),
    Onboardingitem(
      iconPath: 'lib/assets/icons/onboarding_pic3.png',
      title: 'Receive Money From Anywhere In The World',
    ),
  ];

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();
  var allowScroll = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) {
                  var item = widget.boardingItem[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: OnboardingItemScreen(
                      iconPath: item.iconPath,
                      title: item.title,
                    ),
                  );
                }),
          ),
          SmoothPageIndicator(
            controller: pageController, // PageController
            count: widget.boardingItem.length,
            effect: ExpandingDotsEffect(
              dotColor: Colors.grey,
              activeDotColor: primeGreen,
            ), // your preferred effect
            onDotClicked: (index) {
              pageController.animateToPage(
                index,
                duration: Durations.medium1,
                curve: Curves.easeInOutCubic,
              );
            },
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
                onPressed: () async {
                  if (pageController.page == widget.boardingItem.length - 1) {
                    Get.to(() => LoginScreen());
                  } else {
                    if (allowScroll) {
                      allowScroll = false;
                      await pageController.nextPage(
                        duration: Durations.medium1,
                        curve: Curves.easeInOutCubic,
                      );
                      allowScroll = true;
                    }
                  }
                },
                child: Text('Next'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
