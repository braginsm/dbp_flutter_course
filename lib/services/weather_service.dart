import 'package:dbp_flutter_course/api_client/weather_api_client.dart';
import 'package:dbp_flutter_course/models/network/responses/days_weather/days_weather.dart';
import 'package:dbp_flutter_course/models/network/responses/forecast_weather/forecast_weather.dart';
import 'package:dbp_flutter_course/models/network/responses/location_point/location_point.dart';
import 'package:dbp_flutter_course/utils/error_recorder.dart';

class WeatherService {
  WeatherService({
    required this.apiClient,
    required this.errorRecorder,
  });

  final WeatherApiClient apiClient;
  final ErrorRecorder errorRecorder;

  Future<ForecastWeather> getCityByLocation(LocationPoint point) {
    return apiClient
        .getCityByLocation(point)
        .onError(errorRecorder.recordError);
  }

  Future<DaysWeather> getDaysWeather(LocationPoint point) {
    return apiClient.getDaysWeather(point).onError(errorRecorder.recordError);
  }

  Future<ForecastWeather> getForecastByCityName(String cityName) {
    return apiClient
        .getForecastByCityName(cityName)
        .onError(errorRecorder.recordError);
  }
}
