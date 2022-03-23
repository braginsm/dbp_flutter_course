import 'package:dash_kit_network/dash_kit_network.dart';

class WeatherApiEnvironment extends ApiEnvironment {
  const WeatherApiEnvironment({
    required String baseUrl,
    required this.appId,
    bool validateRequestsByDefault = true,
    bool isRequestsAuthorisedByDefault = false,
  }) : super(
          baseUrl: baseUrl,
          validateRequestsByDefault: validateRequestsByDefault,
          isRequestsAuthorisedByDefault: isRequestsAuthorisedByDefault,
        );

  final String appId;

  static const staging = WeatherApiEnvironment(
    baseUrl: 'https://api.openweathermap.org/data/2.5/',
    appId: 'a3df3d075bbfe167b8d3e4b9e1614ba8',
    validateRequestsByDefault: false,
    isRequestsAuthorisedByDefault: false,
  );
}
