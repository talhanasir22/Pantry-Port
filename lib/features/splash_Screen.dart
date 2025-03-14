import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantryport_app/features/onboarding/wrapper.dart';
import '../Core/appColors.dart';
import '../Shared/circle.dart';
import '../Shared/four_pointer_star_painter.dart';
import '../Shared/main_parallelogram.dart';
import '../Shared/shadow_parallelogram.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const OnboardingWrapper()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.theme,
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width;
            double height;

            /// Set Fixed Width and Height Based on Device Type
            if (constraints.maxWidth < 600) {
              //  Mobile
              width = 210;
              height = 140;
            } else if (constraints.maxWidth < 1200) {
              //  Tablet
              width = 250;
              height = 160;
            } else {
              //  Desktop
              width = 310;
              height = 180;
            }
            return Stack(
              children: [

                ShadowParallelogram(width: width, height: height,top: -35,right: -35,),
                /// Top Parallelogram
                MainParallelogram(width: width, height: height , top: -60 , right: -40,),

                // Logo
                Center(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1861,
                      width: MediaQuery.of(context).size.width * 0.7375,
                      child: Image.asset(
                          "assets/Images/Logo.png")
                  ),
                ),

                // Star
                FourPointedStar(color: Colors.black, width: width, height: height,bottom: 110,right: 50,),

                ShadowParallelogram(width: width, height: height,bottom: -50,left: -20,),
                // Black Circle
                Circle(height: height, width: width, color: Colors.black , bottom: 180 , left: 65,),

                // Milk
                Positioned(
                  bottom: 110,
                  right: 155,
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: Image.asset("assets/Images/6.png"),
                  ),
                ),

                // Cake
                Positioned(
                  bottom: 200,
                  right: 70,
                  child: SizedBox(
                    height: 40.52,
                    width: 90.73,
                    child: Image.asset("assets/Images/4.png"),
                  ),
                ),

                // Rice
                Positioned(
                  bottom: 400,
                  right: 20,
                  child: SizedBox(
                    height: 35.52,
                    width: 35,
                    child: Image.asset("assets/Images/3.png"),
                  ),
                ),

                // Yellow Circle
                Circle(height: height, width: width, color: AppColors.bgColor , bottom: 470,right: 50,),

                // Curd
                Positioned(
                  top: 180,
                  right: 120,
                  child: SizedBox(
                    height: 60,
                    width: 50,
                    child: Image.asset("assets/Images/2.png"),
                  ),
                ),

                // Star
                FourPointedStar(color: AppColors.bgColor, width: width, height: height,top: 240,left: 80,),

                Positioned(
                  top: 270,
                  left: 45,
                  child: SizedBox(
                    height: 60,
                    width: 50,
                    child: Image.asset("assets/Images/1.png"),
                  ),
                ),

                // Yogurt

                Positioned(
                    bottom: 200,
                    left: 22,
                    child: SizedBox(
                        height: 70,
                        width: 60,
                        child: Image.asset("assets/Images/5.png"))
                ),

                /// Bottom Parallelogram
                MainParallelogram(width: width, height: height,bottom: -60,left: -40,)
              ],
            );

          },
        ),
      ),
    );
  }
}