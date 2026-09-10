import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = 'theme_mode';

  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.system));

  Future<void> loadTheme() async {
    final preferences = await SharedPreferences.getInstance();
    final savedTheme = preferences.getString(_themeKey);

    switch (savedTheme) {
      case 'light':
        emit(const ThemeState(themeMode: ThemeMode.light));
        break;

      case 'dark':
        emit(const ThemeState(themeMode: ThemeMode.dark));
        break;

      default:
        emit(const ThemeState(themeMode: ThemeMode.system));
    }
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString(_themeKey, themeMode.name);

    emit(ThemeState(themeMode: themeMode));
  }

  Future<void> toggleTheme() async {
    final platformBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    final isDark =
        state.themeMode == ThemeMode.dark ||
        (state.themeMode == ThemeMode.system &&
            platformBrightness == Brightness.dark);

    await setThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
  }
}
