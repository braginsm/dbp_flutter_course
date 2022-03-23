import 'package:dbp_flutter_course/api_client/weather_api_client.dart';
import 'package:dbp_flutter_course/models/network/responses/days_weather/days_weather.dart';
import 'package:dbp_flutter_course/models/network/responses/forecast_weather/forecast_weather.dart';
import 'package:dbp_flutter_course/models/network/responses/location_point/location_point.dart';

class WeatherService {
  WeatherService(this.apiClient);

  final WeatherApiClient apiClient;

  Future<ForecastWeather> getCityByLocation(LocationPoint point) {
    return apiClient.getCityByLocation(point);
  }

  Future<DaysWeather> getDaysWeather(LocationPoint point) {
    return apiClient.getDaysWeather(point);
  }

  Future<ForecastWeather> getForecastByCityName(String name) {
    return apiClient.getForecastByCityName(name);
  }
}
