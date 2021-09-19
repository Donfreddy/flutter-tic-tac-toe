import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';

class EqualPainter extends CustomPainter {
  static double strokeWidth = 12.0;
  final _paint = Paint()
    ..color = CustomColors.greenIcon
    ..strokeWidth = strokeWidth
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    var dy = (size.height - 2 * strokeWidth) / 3;
    canvas.drawLine(Offset(0.0, dy), Offset(size.width, dy), _paint);
    canvas.drawLine(Offset(0.0, 2 * dy + strokeWidth), Offset(size.width, 2 * dy + strokeWidth), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
