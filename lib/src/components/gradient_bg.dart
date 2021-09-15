import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';

class GradientBG extends StatelessWidget {
  final Widget child;

  const GradientBG({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.01, 0.9],
          colors: [CustomColors.yellowIcon, CustomColors.purpleDark],
        ),
      ),
      child: child,
    );
  }
}
