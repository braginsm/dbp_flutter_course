import 'package:dbp_flutter_course/presentation/home/home_page.dart';
import 'package:dbp_flutter_course/resources/strings.dart';
import 'package:dbp_flutter_course/theme/weather_theme.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) => Center(
        child: MaterialApp(
          title: Strings.appName,
          theme: WeatherTheme.lightTheme,
          home: const HomePage(),
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
        ),
      ),
    );
  }
}
