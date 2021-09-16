import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/common/constants/app_constant.dart';

/// An implicitly animated widget that will animate a change to [scale].
class AnimatedScale extends ImplicitlyAnimatedWidget {
  const AnimatedScale({
    Key? key,
    Curve curve = Curves.easeInOut,
    Duration duration = DURATION_MEDIUM,
    required this.scale,
    required this.child,
  }) : super(key: key, curve: curve, duration: duration);

  final double scale;
  final Widget child;

  @override
  _AnimatedScaleState createState() => _AnimatedScaleState();
}

class _AnimatedScaleState extends AnimatedWidgetBaseState<AnimatedScale> {
  Tween<dynamic>? _scaleTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _scaleTween = visitor(
      _scaleTween,
      widget.scale,
      (dynamic value) => Tween<double>(begin: value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _scaleTween!.evaluate(animation),
      child: widget.child,
    );
  }
}
