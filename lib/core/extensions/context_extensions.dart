import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ColorScheme get colors => theme.colorScheme;

  bool get isDarkMode => theme.brightness == Brightness.dark;

  TextTheme get textTheme => theme.textTheme;

  ThemeData get theme => Theme.of(this);
}
