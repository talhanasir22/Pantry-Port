import 'package:flutter/material.dart';

class FourPointedStar extends StatelessWidget {
  final Color color;
  final double? top;
  final double? right;
  final double? left;
  final double? bottom;
  final double width;
  final double height;


  const FourPointedStar({super.key, required this.color, this.top, this.right, this.left, this.bottom, required this.width, required this.height });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      top: top,
      left: left,
      child: CustomPaint(
        size: Size(width/13, height/20), // Set the size of the star
        painter: FourPointedStarPainter(color),
      ),
    );
  }
}

class FourPointedStarPainter extends CustomPainter {
  final Color color;

  FourPointedStarPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();

    double centerX = size.width / 1.5;
    double centerY = size.height / 1.5;
    double longArm = size.width / 1.5;
    double shortArm = size.width / 5.5;

    // Move to top point
    path.moveTo(centerX, centerY - longArm);
    path.lineTo(centerX + shortArm, centerY - shortArm);
    path.lineTo(centerX + longArm, centerY);
    path.lineTo(centerX + shortArm, centerY + shortArm);
    path.lineTo(centerX, centerY + longArm);
    path.lineTo(centerX - shortArm, centerY + shortArm);
    path.lineTo(centerX - longArm, centerY);
    path.lineTo(centerX - shortArm, centerY - shortArm);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
