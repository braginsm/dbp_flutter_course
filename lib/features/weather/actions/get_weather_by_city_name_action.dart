import 'dart:async';

import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dbp_flutter_course/app/app_state.dart';
import 'package:dbp_flutter_course/app/base_action.dart';
import 'package:dbp_flutter_course/app/operations.dart';
import 'package:dbp_flutter_course/services/weather_service.dart';
import 'package:get_it/get_it.dart';

class GetWeatherByCityNameAction extends BaseAction {
  GetWeatherByCityNameAction({required this.cityName});

  final String cityName;

  @override
  Operation get operationKey => Operation.getWeatherByCityName;

  @override
  FutureOr<AppState?> reduce() async {
    final weatherService = GetIt.I.get<WeatherService>();

    final locality = await weatherService.getForecastByCityName(cityName);

    final daysWeather =
        await weatherService.getDaysWeather(locality.city.coord);

    final today = daysWeather.getToday();

    final nextDays = daysWeather.getNextDays();

    return state.rebuild(
      (s) => s
        ..weather.currentCity = locality.city
        ..weather.today = today
        ..weather.nextDays = BuiltList.of(nextDays).toBuilder()
        ..weather.searchHistory.add(cityName),
    );
  }
}
