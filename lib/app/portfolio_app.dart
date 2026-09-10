import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibrahem_portfolio/core/routing/app_router.dart';
import 'package:ibrahem_portfolio/l10n/app_localizations.dart';

import '../core/theme/app_theme.dart';
import '../logic/locale/locale_cubit.dart';
import '../logic/locale/locale_state.dart';
import '../logic/theme/theme_cubit.dart';
import '../logic/theme/theme_state.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, localeState) {
            final isArabic = localeState.locale.languageCode == 'ar';

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateTitle: (context) =>
                  AppLocalizations.of(context)!.appTitle,
              theme: AppTheme.light.copyWith(
                textTheme: isArabic
                    ? GoogleFonts.cairoTextTheme(AppTheme.light.textTheme)
                    : GoogleFonts.interTextTheme(AppTheme.light.textTheme),
              ),
              darkTheme: AppTheme.dark.copyWith(
                textTheme: isArabic
                    ? GoogleFonts.cairoTextTheme(AppTheme.dark.textTheme)
                    : GoogleFonts.interTextTheme(AppTheme.dark.textTheme),
              ),
              themeMode: themeState.themeMode,
              locale: localeState.locale,
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              initialRoute: AppRouter.home,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        );
      },
    );
  }
}
