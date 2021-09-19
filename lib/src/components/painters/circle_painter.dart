import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';

class CirclePainter extends CustomPainter {
  final double fraction;
  final double circleWidth;
  late Paint _circlePaint;

  CirclePainter({required this.fraction, this.circleWidth = 12.0}) {
    _circlePaint = Paint()
      ..color = CustomColors.textHeader
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var rect = const Offset(0.0, 0.0) & size;

    canvas.drawArc(rect, -math.pi / 2, math.pi * 2 * fraction, false, _circlePaint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.fraction != fraction;
  }
}
