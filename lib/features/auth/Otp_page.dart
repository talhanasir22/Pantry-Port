import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexagon/hexagon.dart';
import '../../Core/appColors.dart';
import '../../Core/apptext.dart';
import '../../Data/Firebase/Services/phone_auth_services.dart';
import '../../Shared/loading_indicator.dart';
import '../../Shared/main_parallelogram.dart';
import '../../Shared/shadow_parallelogram.dart';
import '../home/locoation_option_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String selectedCountryCode = "+92";
  bool _isLoading = false;
  final PhoneAuthService _authService = PhoneAuthService();
  final List<TextEditingController> _otpControllers =
  List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

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
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 430,
                      width: 400,
                      child: Column(
                        spacing: 10,
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
                                  text: "OTP ",
                                  style: AppText.onboardingHeadingStyle(),
                                ),
                                TextSpan(
                                  text: "Verification",
                                  style: AppText.onboardingHeadingStyle()
                                      .copyWith(color: AppColors.bgColor),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "          Enter the OTP\n",
                                  style: AppText.hintTextStyle(),
                                ),
                                TextSpan(
                                  text: "sent to $selectedCountryCode 000 000 0000",
                                  style: AppText.hintTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: SizedBox(
                                  width: 55,
                                  height: 65,
                                  child: TextField(
                                    controller: _otpControllers[index],
                                    focusNode: _focusNodes[index],
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    style: AppText.descriptionTextStyle(),
                                    decoration: InputDecoration(
                                      counterText: "",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                        BorderSide(color: AppColors.bgColor, width: 2),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.isNotEmpty && index < 3) {
                                        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                                      } else if (value.isEmpty && index > 0) {
                                        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                                      }
                                    },
                                  ),
                                ),
                              );
                            }),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Didn\'t Recieve the OTP? ",
                                  style: AppText.hintTextStyle(),
                                ),
                                TextSpan(
                                  text: "Resend OTP",
                                  style: AppText.hintTextStyle().copyWith(
                                    color: AppColors.bgColor,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: ElevatedButton(
                              onPressed: () async {
                                String otp = _otpControllers.map((c) => c.text).join();

                                if (otp.length < 4) {
                                  // Show message if fields are empty
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Please fill all OTP fields"))
                                  );
                                  return;
                                }

                                setState(() {
                                  _isLoading = true;
                                }
                                );

                                bool isOtpValid =  await _authService.verifyOTP(otp) as bool;

                                setState(() {
                                  _isLoading = false;
                                });

                                if (isOtpValid) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LocationOptionPage()),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Invalid OTP, please try again")),
                                  );
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
                                "Submit",
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
