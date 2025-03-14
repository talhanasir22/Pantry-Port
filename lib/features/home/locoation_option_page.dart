import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Core/appColors.dart';
import '../../Core/apptext.dart';
import '../../Shared/main_parallelogram.dart';
import '../../Shared/shadow_parallelogram.dart';

class LocationOptionPage extends StatelessWidget{
  const LocationOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.theme,
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width, height;
            if (constraints.maxWidth < 600) {
              width = 210;
              height = 140;
            } else if (constraints.maxWidth < 1200) {
              width = 250;
              height = 160;
            } else {
              width = 310;
              height = 180;
            }

            return Center(
              child: Stack(
                children: [
                  ShadowParallelogram(width: width, height: height, top: -35, right: -35),
                  MainParallelogram(width: width, height: height, top: -60, right: -40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      SizedBox(
                        height: 400,
                          width: double.maxFinite,
                          child: Image.asset("assets/Images/map.png")),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Please Share Your ",
                              style: AppText.onboardingHeadingStyle(),
                            ),
                            TextSpan(
                              text: "Location",
                              style: AppText.onboardingHeadingStyle().copyWith(
                                  color: AppColors.bgColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "We Need Your delivery Location to\n",
                              style: AppText.hintTextStyle(),
                            ),
                            TextSpan(
                              text: "          Provide Better Services",
                              style: AppText.hintTextStyle(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(
                            //       builder: (context)=> LocationOptionPage(),
                            //     ));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.bgColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.my_location,color: Colors.white,),
                              Text(" Search Device Location", style: AppText.buttonTextStyle()),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(
                            //       builder: (context)=> LocationOptionPage(),
                            //     ));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(width: 0.5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search,color: Colors.black,),
                              Text(" Enter Location Manually",
                                  style: AppText.descriptionTextStyle()
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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