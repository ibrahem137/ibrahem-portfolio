import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/locale/locale_cubit.dart';
import '../logic/theme/theme_cubit.dart';
import 'portfolio_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()..loadTheme()),
        BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()..loadLocale()),
      ],
      child: const PortfolioApp(),
    );
  }
}
