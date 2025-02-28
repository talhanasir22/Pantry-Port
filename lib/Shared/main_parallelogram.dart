import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pantryport_app/Core/appColors.dart';

class MainParallelogram extends StatelessWidget{
  const MainParallelogram({super.key,  this.top, this.right, this.left, this.bottom, required this.width, required this.height});

  final double? top;
  final double? right;
  final double? left;
  final double? bottom;
  final double width;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: Transform.rotate(
        angle: 28 * pi / 180, // Convert degrees to radians
        child: Container(
          width: width, // Consistent width
          height: height, // Consistent height
          decoration: BoxDecoration(
            color: AppColors.bgColor, // Main parallelogram color
            borderRadius: BorderRadius.circular(28), // Fully rounded
            boxShadow: [
              BoxShadow(
                color: Colors.black26, // Subtle shadow

              ),
            ],
          ),
        ),
      ),
    );
  }

}