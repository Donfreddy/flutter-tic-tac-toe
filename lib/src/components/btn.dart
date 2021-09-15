import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';

class Btn extends StatelessWidget {
  final List<Color> gradient;
  final Color color;
  final double height;
  final double width;
  final GestureTapCallback onTap;
  final double borderRadius;
  final Widget child;

  const Btn({
    Key? key,
    required this.gradient,
    required this.color,
    required this.onTap,
    required this.child,
    required this.borderRadius,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.1, 0.8],
            colors: gradient,
          ),
          boxShadow: const [BoxShadow(color: CustomColors.purpleShadow, spreadRadius: 5, blurRadius: 10)],
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
