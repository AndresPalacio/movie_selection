import 'package:flutter/material.dart';
import 'package:movie_ticker/movie_ticker/animations/opacity_animation.dart';
import 'package:movie_ticker/movie_ticker/animations/scale_animation.dart';
import 'package:movie_ticker/movie_ticker/animations/translate_animation.dart';

import '../../constants.dart';
import 'movie_details_widgets.dart';

class GradientAnimationButton extends StatelessWidget {
  const GradientAnimationButton({
    Key key,
    @required this.hideWidgets,
    this.label,
    this.onPressed,
  }) : super(key: key);

  final ValueNotifier<bool> hideWidgets;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hideWidgets,
      builder: (context, value, child) {
        return AnimatedPositioned(
          curve: Curves.fastOutSlowIn,
          duration: kDuration400ms,
          bottom: value ? -150 : 20,
          left: 20,
          right: 20,
          child: child,
        );
      },
      child: TranslateAnimation(
        child: ScaleAnimation(
          child: OpacityAnimation(
            child: GradientButton(
              onTap: () {
                hideWidgets.value = true;
                onPressed();
              },
              text: label,
            ),
          ),
        ),
      ),
    );
  }
}
