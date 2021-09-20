import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/animations/animated_scales.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';
import 'package:tic_tac_toe/src/themes/style.dart';

class ButtonBase extends StatefulWidget {
  const ButtonBase({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;

  @override
  _ButtonBaseState createState() => _ButtonBaseState();
}

class _ButtonBaseState extends State<ButtonBase> {
  bool _tapDown = false;

  void _updateTapDown(bool value) {
    if (_tapDown != value) {
      setState(() {
        _tapDown = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScales(
      scale: _tapDown ? .9 : 1,
      curve: Curves.easeOutCirc,
      duration: Times.xlong,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (_) => _updateTapDown(true),
        onTapUp: (_) => _updateTapDown(false),
        onTapCancel: () => _updateTapDown(false),
        onTap: widget.onTap,
        child: widget.child,
      ),
    );
  }
}

class Btn extends StatelessWidget {
  final List<Color>? gradient;
  final Color? color;
  final double height;
  final double width;
  final VoidCallback onTap;
  final double borderRadius;
  final Widget child;

  const Btn({
    Key? key,
    this.gradient,
    this.color,
    required this.onTap,
    required this.child,
    required this.borderRadius,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      onTap: onTap,
      child: AnimatedTheme(
        data: ThemeData(),
        child: Builder(builder: (context) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: color ?? CustomColors.textHeader,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0.1, 0.8],
                colors: gradient ?? [CustomColors.textWhite, CustomColors.textWhite],
              ),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 5, blurRadius: 10)],
            ),
            child: Center(
              child: child,
            ),
          );
        }),
      ),
    );
  }
}
