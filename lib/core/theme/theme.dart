import 'package:flutter/material.dart';
import 'package:twear/core/theme/cubit/theme_cubit.dart';

abstract class CTheme {
  Color? backgroundColor;
  Color? buttonColor;
  Color? borderColor;
  Color? borderColor2;
  Color? primTextColor;
  Color? appBarColor;
  Color? secondaryTextColor;
  Color? shadowColor;
  Color? oppositeTextColor;
  Color? iconColor;

  ThemeData getTheme();
  ThemeType getThemeType() => ThemeType();
}
