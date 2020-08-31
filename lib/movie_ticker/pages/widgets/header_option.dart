import 'package:flutter/material.dart';
import 'package:movie_ticker/movie_ticker/constants.dart';

class HeaderOption extends StatelessWidget {
  const HeaderOption({
    Key key,
    this.title,
    this.isSelected,
  }) : super(key: key);

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment(0, .5),
        height: double.infinity,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(.9),
            letterSpacing: 2,
            fontFamily: "BarlowCondensed",
            fontSize: 28,
          ),
        ),
        decoration: BoxDecoration(
          gradient: isSelected
              ? kGradientRedOrange
              : null,
        ),
      ),
    );
  }
}
