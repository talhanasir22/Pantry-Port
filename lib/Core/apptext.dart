import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText{

  static TextStyle onboardingHeadingStyle(){
    return GoogleFonts.inter(
      fontSize: 25,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle onboardingDescStyle(){
    return GoogleFonts.inter(
      fontSize: 14,
      letterSpacing: 1,
      color: Color(0xff000000),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle buttonTextStyle(){
    return GoogleFonts.inter(
      fontSize: 18,
      color: Color(0xffFFFFFF),
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle descriptionTextStyle(){
    return GoogleFonts.inter(
      fontSize: 16,
      color: Color(0xff000000),
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle hintTextStyle(){
    return GoogleFonts.inter(
      fontSize: 13,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    );
  }

}