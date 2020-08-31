import 'package:flutter/material.dart';

class ScaleAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double initScale;
  final double finalScale;
  final Curve curve;

  const ScaleAnimation({
    Key key,
    this.duration = const Duration(milliseconds: 800),
    this.child,
    this.curve = Curves.fastOutSlowIn,
    this.initScale = 0.0,
    this.finalScale = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      child: child,
      curve: curve,
      tween: Tween(begin: initScale, end: finalScale),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
    );
  }
}
