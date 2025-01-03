
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twear/core/theme/cubit/theme_cubit.dart';
import 'package:twear/core/theme/theme.dart';

CTheme getThemeMode(BuildContext context) {
  return context.watch<ThemeCubit>().state;

}