import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twear/core/theme/dark/dt.dart';
import 'package:twear/core/theme/light/lt.dart';
import 'package:twear/core/theme/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<CTheme> {
  ThemeCubit() : super(ThemeMode.dT);

  void toggleTheme(ThemeType themeType) {
    emit(themeType is Dark ? ThemeMode.dT : ThemeMode.lT);
  }
}
