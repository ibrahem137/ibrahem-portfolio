import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  static const String _localeKey = 'locale';

  LocaleCubit() : super(const LocaleState(locale: Locale('en')));

  Future<void> loadLocale() async {
    final preferences = await SharedPreferences.getInstance();

    final savedLocale = preferences.getString(_localeKey);

    if (savedLocale == 'ar') {
      emit(const LocaleState(locale: Locale('ar')));
    } else {
      emit(const LocaleState(locale: Locale('en')));
    }
  }

  Future<void> setLocale(Locale locale) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString(_localeKey, locale.languageCode);

    emit(LocaleState(locale: locale));
  }

  Future<void> toggleLocale() async {
    final newLocale = state.locale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');

    await setLocale(newLocale);
  }
}
