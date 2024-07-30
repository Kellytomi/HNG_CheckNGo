import 'package:checkngo/src/utils/colors.dart';
import 'package:flutter/material.dart';

class JaggedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = kFontColor2
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0;

    double dashWidth = 4.0;
    double dashSpace = 3.0;
    double startX = 0;
    final double endX = size.width;

    while (startX < endX) {
      canvas.drawLine(Offset(startX, size.height / 2),
          Offset(startX + dashWidth, size.height / 2), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
