import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/appColors.dart';
import '../Core/apptext.dart';
import '../features/home/role_selection_page.dart';

class GetStartedButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.074,
      width: MediaQuery.of(context).size.width * 0.90,
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> RoleSelectionPage()));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.bgColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
        child: Text("Get Started",
          style: AppText.buttonTextStyle(),
        ),
      ),
    );
  }
  
}