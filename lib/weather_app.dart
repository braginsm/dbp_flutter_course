import 'package:dbp_flutter_course/presentation/home/home_page.dart';
import 'package:dbp_flutter_course/resources/strings.dart';
import 'package:dbp_flutter_course/theme/weather_theme.dart';
import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        title: Strings.appName,
        theme: WeatherTheme.lightTheme,
        home: const HomePage(),
      ),
    );
  }
}
