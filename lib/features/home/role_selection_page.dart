import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:pantryport_app/features/auth/login_page.dart';
import 'package:pantryport_app/features/home/locoation_option_page.dart';

import '../../Core/appColors.dart';
import '../../Core/apptext.dart';
import '../../Shared/main_parallelogram.dart';
import '../../Shared/shadow_parallelogram.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.theme,
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width;
            double height;

            if (constraints.maxWidth < 600) {
              // Mobile
              width = 210;
              height = 140;
            } else if (constraints.maxWidth < 1200) {
              // Tablet
              width = 250;
              height = 160;
            } else {
              // Desktop
              width = 310;
              height = 180;
            }

            return Center(
              child: Stack(
                children: [
                  ShadowParallelogram(width: width, height: height, top: -35, right: -35),
                  /// Top Parallelogram
                  MainParallelogram(width: width, height: height, top: -60, right: -40),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 330,
                      width: 400,
                      child: Column(

                        children: [
                          SizedBox(height: 20,),

                          Text("Choose",
                            style: AppText.onboardingHeadingStyle(),
                            textAlign: TextAlign.center,
                          ),

                          Text("Your Account",
                            textAlign: TextAlign.center,
                            style: AppText.onboardingHeadingStyle().copyWith(color: AppColors.bgColor),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Column(
                                spacing: 5,
                                children: [
                                  Transform.rotate(
                                    angle: 33,
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                      },
                                      child: HexagonWidget.flat(
                                        width: 150,
                                        height: 160,
                                        color: AppColors.bgColor,
                                        cornerRadius: 10,
                                        child: Transform.rotate(
                                          angle: 4.7,
                                            child: SizedBox(
                                              height: 110,
                                                child: Image.asset("assets/Images/shopkeeper.png"))),
                                      ),
                                    ),
                                  ),
                                  Text("Shopkeeper",style: AppText.descriptionTextStyle()) 
                                ],
                              ),
                              Column(
                                spacing: 5,
                                children: [
                                  Transform.rotate(
                                    angle: 33,
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                      },
                                      child: HexagonWidget.flat(
                                        width: 150,
                                        height: 160,
                                        color: Colors.black,
                                        cornerRadius: 10,
                                        child: Transform.rotate(
                                            angle: 4.7,
                                            child: SizedBox(
                                                height: 110,
                                                child: Image.asset("assets/Images/customer.png"))),
                                      ),
                                    ),
                                  ),
                                  Text("Customer",style: AppText.descriptionTextStyle(),)
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding( 
                    padding: const EdgeInsets.all(18.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LocationOptionPage()));
                      },
                          child: Text("Skip Login",style: AppText.descriptionTextStyle(),))
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
