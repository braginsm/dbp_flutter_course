import 'package:dbp_flutter_course/models/weather_day.dart';
import 'package:dbp_flutter_course/resources/images.dart';

final weatherDayMock = WeatherDay(
  dayName: 'Monday',
  degrees: '12',
  icon: Images.ic01d,
  locationName: 'Amsterdam',
  weatherDescription: '40%',
);

final nexDaysMock = [
  weatherDayMock,
  weatherDayMock,
  weatherDayMock,
  weatherDayMock,
];
