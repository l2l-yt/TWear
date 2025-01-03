// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:twear/core/theme/cubit/theme_cubit.dart';
import 'package:twear/core/theme/theme.dart';

class LightTheme extends CTheme {
  @override
  Color? backgroundColor = Colors.white;
  @override
  Color? buttonColor = Colors.white;
  @override
  Color? borderColor2 = Colors.blue[600];
  @override
  Color? borderColor = Colors.black;
  @override
  Color? primTextColor = Colors.black;
  @override
  Color? appBarColor = Colors.white;
  @override
  Color? secondaryTextColor = Colors.grey[600];
  @override
  Color? shadowColor = Colors.black.withOpacity(.3);
  @override
  Color? oppositeTextColor = Colors.black;
  @override
  Color? iconColor = Colors.grey[800];

  @override
  ThemeData getTheme() {
    return ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(backgroundColor: appBarColor),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(8),
          helperStyle: TextStyle(color: primTextColor),
          labelStyle: TextStyle(
            color: primTextColor,
            fontSize: 12,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: borderColor ?? Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: borderColor2 ?? Colors.red,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: borderColor ?? Colors.red,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textTheme: TextTheme(
            bodyMedium: TextStyle(color: primTextColor, fontFamily: "arial")));
  }

  @override
  ThemeType getThemeType() => Light();
}
