import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ibrahem_portfolio/firebase_options.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final analytics = FirebaseAnalytics.instance;

  await analytics.setAnalyticsCollectionEnabled(true);

  await analytics.logEvent(name: 'portfolio_opened');

  runApp(const App());
}
