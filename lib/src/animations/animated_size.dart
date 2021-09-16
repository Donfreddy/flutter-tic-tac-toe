import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/common/constants/app_constant.dart';

/// Builds an [AnimatedSize] widget with the [child].
///
/// Used to allow using the [AnimatedSize] without having to make a widget
/// stateful.
class CustomAnimatedSize extends StatefulWidget {
  const CustomAnimatedSize({
    Key? key,
    required this.child,
    this.duration = DURATION_MEDIUM,
    this.curve = Curves.easeOutCubic,
    this.alignment = Alignment.center,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final Curve curve;
  final Alignment alignment;

  @override
  _CustomAnimatedSizeState createState() => _CustomAnimatedSizeState();
}

class _CustomAnimatedSizeState extends State<CustomAnimatedSize>
    with SingleTickerProviderStateMixin<CustomAnimatedSize> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: widget.duration,
      curve: widget.curve,
      alignment: widget.alignment,
      child: widget.child,
    );
  }
}
