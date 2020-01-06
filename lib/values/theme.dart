// flutter imports
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/values/dimen.dart';

final appTheme = ThemeData(
    textTheme: TextTheme(
      headline: TextStyle(fontSize: dimen['headlineTextSize'], fontFamily: 'Raleway', color: colors['primaryTextColor']),
      title: TextStyle(fontSize: dimen['titleTextSize'], fontFamily: 'Raleway', color: colors['primaryTextColor']),
      body1: TextStyle(fontSize: dimen['bodyTextSize'], fontFamily: 'Raleway', color: colors['primaryTextColor']),
      body2: TextStyle(fontSize: dimen['smallBodyTextSize'], fontFamily: 'Raleway', color: colors['primaryTextColor']),
      display1: TextStyle(fontSize: dimen['bodyTextSize'], fontFamily: 'Raleway', color: colors['secondaryTextColor']),
      display2: TextStyle(fontSize: dimen['smallBodyTextSize'], fontFamily: 'Raleway', color: colors['secondaryTextColor']),
    ),
    dividerColor: colors['dividerColor'],
    focusColor: colors['primaryColor'],
    highlightColor: colors['primaryHighlightColor'],
    buttonColor: colors['primaryColor'],
    splashColor: colors['secondaryHighlightColor'],
    cursorColor: colors['primaryColor'],
    indicatorColor: colors['primaryColor'],
    primaryIconTheme: IconThemeData(size: dimen['primaryIconSize'], color: colors['primaryTextColor']),
    accentIconTheme: IconThemeData(size: dimen['secondaryIconSize'], color: colors['primaryColor']),
    appBarTheme: AppBarTheme(elevation: dimen['appBarElevation'], color: colors['colorWhite'])
);
