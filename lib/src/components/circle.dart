import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';

class Circle extends StatefulWidget {
  const Circle({Key? key, this.circleWidth}) : super(key: key);

  final double? circleWidth;

  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<Circle> with SingleTickerProviderStateMixin {
  double _fraction = 0.0;
  late Animation<double> _animation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
        });
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomPaint(
            painter: CirclePainter(fraction: _fraction, circleWidth: widget.circleWidth!),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

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

    canvas.drawArc(rect, -pi / 2, pi * 2 * fraction, false, _circlePaint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.fraction != fraction;
  }
}
