import 'package:flutter/material.dart';
import 'package:pantryport_app/Core/appColors.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: isActive ? 29 : 9,
      decoration: BoxDecoration(
        color: isActive ? AppColors.bgColor : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
