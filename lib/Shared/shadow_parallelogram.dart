import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:pantryport_app/Core/appColors.dart';

class ShadowParallelogram extends StatelessWidget{
  const ShadowParallelogram({super.key, this.top, this.right, this.left, this.bottom, required this.width, required this.height});

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
      bottom: bottom,
      left: left,
      child: Transform.rotate(
        angle: 28 * pi / 180, // Convert degrees to radians
        child: Opacity(
          opacity: 0.5,
          child: Container(
            width: width, // Consistent width
            height: height, // Consistent height
            decoration: BoxDecoration(
              color: AppColors.shadowColor,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ),
    );
  }

}