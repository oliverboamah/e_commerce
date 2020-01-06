// flutter imports
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/values/dimen.dart';

final appTheme = ThemeData(
    textTheme: TextTheme(
      headline: TextStyle(
          fontSize: headlineTextSize,
          fontFamily: 'Raleway',
          color: primaryTextColor),
      title: TextStyle(
          fontSize: titleTextSize,
          fontFamily: 'Raleway',
          color: primaryTextColor),
      body1: TextStyle(
          fontSize: bodyTextSize,
          fontFamily: 'Raleway',
          color: primaryTextColor),
      body2: TextStyle(
          fontSize: smallBodyTextSize,
          fontFamily: 'Raleway',
          color: primaryTextColor),
      display1: TextStyle(
          fontSize: bodyTextSize,
          fontFamily: 'Raleway',
          color: secondaryTextColor),
      display2: TextStyle(
          fontSize: smallBodyTextSize,
          fontFamily: 'Raleway',
          color: secondaryTextColor),
      display3: TextStyle(
          fontSize: bodyTextSize, fontFamily: 'Raleway', color: primaryColor),
    ),
    dividerColor: dividerColor,
    focusColor: primaryColor,
    highlightColor: primaryHighlightColor,
    buttonColor: primaryColor,
    splashColor: secondaryHighlightColor,
    cursorColor: primaryColor,
    indicatorColor: primaryColor,
    primaryIconTheme:
        IconThemeData(size: primaryIconSize, color: primaryTextColor),
    accentIconTheme:
        IconThemeData(size: secondaryIconSize, color: primaryColor),
    appBarTheme: AppBarTheme(elevation: appBarElevation, color: colorWhite));
