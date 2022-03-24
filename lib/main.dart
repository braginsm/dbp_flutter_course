import 'dart:async';

import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dbp_flutter_course/app/app_state.dart';
import 'package:dbp_flutter_course/app/store/store.dart';
import 'package:dbp_flutter_course/configuration/api_client.dart';
import 'package:dbp_flutter_course/configuration/weather_api_environment.dart';
import 'package:dbp_flutter_course/firebase_options.dart';
import 'package:dbp_flutter_course/weather_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final store = configureStore();

  const environment = WeatherApiEnvironment.staging;
  final apiClient = configureApiClient(environment);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  configureDependencyInjection(apiClient);

  await initializeDateFormatting('ru_RU', null);

  runZonedGuarded(
    () {
      runApp(
        StoreProvider<AppState>(
          store: store,
          child: const WeatherApp(),
        ),
      );
    },
    FirebaseCrashlytics.instance.recordError,
  );
}
