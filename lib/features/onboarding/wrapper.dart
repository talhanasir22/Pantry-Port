import 'package:flutter/material.dart';
import 'package:pantryport_app/Shared/DotIndicator.dart';
import 'package:pantryport_app/features/onboarding/screen_one.dart';
import 'package:pantryport_app/features/onboarding/screen_three.dart';
import 'package:pantryport_app/features/onboarding/screen_two.dart';

import '../home/role_selection_page.dart';

class OnboardingWrapper extends StatefulWidget {
  const OnboardingWrapper({super.key});

  @override
  _OnboardingWrapperState createState() => _OnboardingWrapperState();
}

class _OnboardingWrapperState extends State<OnboardingWrapper> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _skipOnboarding() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> RoleSelectionPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              ScreenOne(),
              ScreenTwo(),
              ScreenThree(),
            ],
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: _skipOnboarding,
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Positioned(
            bottom: 130,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return DotIndicator(isActive: _currentPage == index);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
