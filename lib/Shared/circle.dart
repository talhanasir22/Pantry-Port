import 'package:flutter/cupertino.dart';

class Circle extends StatelessWidget{
  const Circle({super.key, required this.height, required this.width, required this.color, this.top, this.right, this.left, this.bottom});
  final double height;
  final double width;
  final Color color;
  final double? top;
  final double? right;
  final double? left;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      left: left,
      top: top,
      child: Container(
        height: height/14.36,
        width: width/14.36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }

}