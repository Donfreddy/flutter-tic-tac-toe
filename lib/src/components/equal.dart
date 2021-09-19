import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/components/painters/equal_painter.dart';

class Equal extends StatelessWidget {
  const Equal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomPaint(
            painter: EqualPainter(),
          ),
        ),
      ),
    );
  }
}

