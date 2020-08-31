import 'package:flutter/material.dart';

const Color kAccentColor = Color(0xffFF4259);
const Color kAccentSecondaryColor = Color(0xffFF6313);
const Color kPrimaryColorHeavy = Color(0xff1f1f2f);
const Color kPrimaryColorDark = Color(0xff303043);
const Color kPrimaryColor = Color(0xff454561);
const Color kPrimaryColorLight = Color(0xffa0a0bf);

const TextStyle kMovieTextStyle = TextStyle(
  fontSize: 20,
  letterSpacing: 2,
  fontFamily: 'BarlowCondensed',
  fontWeight: FontWeight.w600,
  color: Colors.white,
);


const kDuration400ms = const Duration(milliseconds: 400);

const kGradientRedOrange = LinearGradient(
    colors: [kAccentColor, kAccentSecondaryColor],
    begin: Alignment.topCenter,
    end: Alignment(1.8, 1));
