import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pantryport_app/Core/appColors.dart';
import 'package:hexagon/hexagon.dart';
import 'package:pantryport_app/Core/apptext.dart';
import 'package:pantryport_app/Shared/get_started_button.dart';
import 'package:pantryport_app/features/home/role_selection_page.dart';

import '../auth/login_page.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          // Positioned hexagon at the bottom left
          Positioned(
            top: 495, // Align to bottom
            left: -206, // Align to left
            child: Transform.rotate(
              angle: 35 * pi / 180,
              child: HexagonWidget.flat(
                width: 750,
                height: 600,
                color: AppColors.theme,
                cornerRadius: 150, // Rounded corners
              ),
            ),
          ),

          // Centered image
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 473,
              child: Image.asset("assets/Images/shopping_cart.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 330,
              width: 400,
              child: Column(

                children: [
                  SizedBox(height: 20,),
                  
                  Text("Welcome To",
                  style: AppText.onboardingHeadingStyle(),
                    textAlign: TextAlign.center,
                  ),
                  
                  Text("Online Grocery App",
                    textAlign: TextAlign.center,
                    style: AppText.onboardingHeadingStyle().copyWith(color: AppColors.bgColor),
                  ),

                  SizedBox(height: 15,),
                  SizedBox(
                    width: 352,
                    child: Text("The Online Grocery App aims to create a seamless digital platform connecting local grocery shopkeepers with customers",
                    style: AppText.onboardingDescStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 80,),
                  GetStartedButton()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
