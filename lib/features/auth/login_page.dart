import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:hexagon/hexagon.dart';
import 'package:pantryport_app/Shared/loading_indicator.dart';

import '../../Core/appColors.dart';
import '../../Core/apptext.dart';
import '../../Data/Firebase/Services/phone_auth_services.dart';
import '../../Shared/main_parallelogram.dart';
import '../../Shared/shadow_parallelogram.dart';
import 'Otp_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedCountryCode = "+92";
  bool _isLoading = false;
  final PhoneAuthService _authService = PhoneAuthService();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.theme,
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width;
            double height;

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
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 400,
                      width: 400,
                      child: Column(
                        spacing: 20,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.rotate(
                            angle: 33,
                            child: HexagonWidget.flat(
                              width: 150,
                              height: 160,
                              color: AppColors.bgColor,
                              cornerRadius: 10,
                              child: Transform.rotate(
                                angle: 4.7,
                                child: SizedBox(
                                  height: 110,
                                  child: Image.asset("assets/Images/login.png"),
                                ),
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Login your ",
                                  style: AppText.onboardingHeadingStyle(),
                                ),
                                TextSpan(
                                  text: "Account",
                                  style: AppText.onboardingHeadingStyle().copyWith(color: AppColors.bgColor),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth * 0.9 > 380 ? 380 : screenWidth * 0.9,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 4)],
                            ),
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: _phoneNumberController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CountryCodePicker(
                                          onChanged: (code) {
                                            setState(() {
                                              selectedCountryCode = code.dialCode!;
                                            });
                                          },
                                          initialSelection: selectedCountryCode,
                                          favorite: ['+92', '+1', '+44'],
                                          showCountryOnly: false,
                                          showOnlyCountryWhenClosed: false,
                                          alignLeft: false,
                                          textStyle: TextStyle(color: Colors.black),
                                          flagWidth: 20,
                                          searchDecoration: InputDecoration(
                                            hintText: "Search country",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  hintText: "Enter Mobile Number",
                                  hintStyle: AppText.hintTextStyle(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: AppColors.bgColor, width: 2),
                                  ),
                                ),
                                validator: (value){
                                  if(value == null || value.isEmpty){  // ✅ Safe null check
                                    return "Please fill the field";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) { // Ensure form validation
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  String formattedNumber = '$selectedCountryCode${_phoneNumberController.text.trim()}';
                                  await _authService.sendOTP(formattedNumber);

                                  // Wait for 1 second before navigating
                                  await Future.delayed(Duration(seconds: 1));

                                  if (mounted) {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage()));
                                  }

                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.bgColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: _isLoading
                                  ? LoadingIndicator()
                                  : Text(
                                "Send OTP",
                                style: AppText.buttonTextStyle(),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
