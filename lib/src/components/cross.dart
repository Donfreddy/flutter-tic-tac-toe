import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';

class Cross extends StatefulWidget {
  const Cross({Key? key, this.crossWidth}) : super(key: key);

  final double? crossWidth;

  @override
  _CrossState createState() => _CrossState();
}

class _CrossState extends State<Cross> with SingleTickerProviderStateMixin {
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
            painter: CrossPainter(fraction: _fraction, crossWidth: widget.crossWidth!),
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
