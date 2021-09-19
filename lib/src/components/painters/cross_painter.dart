import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';

class CrossPainter extends CustomPainter {
  final double fraction;
  final double crossWidth;
  late Paint _crossPaint;

  CrossPainter({
    required this.fraction,
    this.crossWidth = 12.0,
  }) {
    _crossPaint = Paint()
      ..color = CustomColors.purpleDark
      ..strokeWidth = crossWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double leftLineFraction, rightLineFraction;

    if (fraction < .5) {
      leftLineFraction = fraction / .5;
      rightLineFraction = 0.0;
    } else {
      leftLineFraction = 1.0;
      rightLineFraction = (fraction - .5) / .5;
    }

    canvas.drawLine(
      const Offset(0.0, 0.0),
      Offset(size.width * leftLineFraction, size.height * leftLineFraction),
      _crossPaint,
    );

    if (fraction >= .5) {
      canvas.drawLine(
        Offset(size.width, 0.0),
        Offset(size.width - size.width * rightLineFraction, size.height * rightLineFraction),
        _crossPaint,
      );
    }
  }

  @override
  bool shouldRepaint(CrossPainter oldDelegate) {
    return oldDelegate.fraction != fraction;
  }
}
