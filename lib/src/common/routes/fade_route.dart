import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/common/constants/app_constant.dart';

/// A [PageRoute] that fades into the new widget.
class FadeRoute<T> extends PageRoute<T> {
  FadeRoute({
    required this.builder,
    required RouteSettings settings,
    this.duration = DURATION_LONG,
  }) : super(settings: settings);

  final WidgetBuilder builder;
  final Duration duration;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => duration;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }
}
