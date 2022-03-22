import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dbp_flutter_course/app/app_state.dart';
import 'package:dbp_flutter_course/app/store/store.dart';
import 'package:dbp_flutter_course/weather_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencyInjection();

  final store = configureStore();

  runApp(
    StoreProvider<AppState>(
      store: store,
      child: const WeatherApp(),
    ),
  );
}
