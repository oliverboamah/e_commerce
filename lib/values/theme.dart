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
      subhead: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
          color: colorWhite,
          fontSize: bodyTextSize),
      display3: TextStyle(
          fontSize: bodyTextSize, fontFamily: 'Raleway', color: primaryColor),
      caption: TextStyle(
          fontSize: bodyTextSize, fontFamily: 'Raleway', color: colorWhite),
    ),
    accentTextTheme: TextTheme(
        title: TextStyle(
            fontFamily: 'Raleway',
            color: secondaryTextColor,
            fontSize: titleTextSize),
        body1: TextStyle(
            fontFamily: 'Raleway',
            color: primaryColor,
            fontSize: titleTextSize),
        body2: TextStyle(
            fontFamily: 'Raleway', color: linkColor, fontSize: bodyTextSize),
        display1: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontSize: titleTextSize),
        display2: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            color: colorWhite,
            fontSize: titleTextSize),
        display3: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            color: primaryColor,
            fontSize: headlineTextSize),
        overline: TextStyle(
            decoration: TextDecoration.lineThrough,
            fontFamily: 'Raleway',
            color: secondaryTextColor,
            fontSize: bodyTextSize),
        subhead: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            color: primaryTextColor,
            fontSize: bodyTextSize),
        caption: TextStyle(
            fontFamily: 'Raleway', color: colorWhite, fontSize: titleTextSize)),
    dividerColor: dividerColor,
    focusColor: primaryColor,
    highlightColor: primaryHighlightColor,
    buttonColor: primaryColor,
    splashColor: primaryHighlightColor,
    cursorColor: primaryColor,
    indicatorColor: primaryColor,
    primaryIconTheme:
        IconThemeData(size: primaryIconSize, color: primaryTextColor),
    accentIconTheme:
        IconThemeData(size: secondaryIconSize, color: primaryColor),
    appBarTheme: AppBarTheme(elevation: appBarElevation, color: colorWhite));
