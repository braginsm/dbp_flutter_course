library weather_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:dbp_flutter_course/models/network/responses/city_item/city_item.dart';
import 'package:dbp_flutter_course/models/weather_day.dart';
import 'package:dbp_flutter_course/resources/images.dart';

part 'weather_state.g.dart';

abstract class WeatherState
    implements Built<WeatherState, WeatherStateBuilder> {
  factory WeatherState([void Function(WeatherStateBuilder b) updates]) =
      _$WeatherState;

  WeatherState._();

  CityItem? get currentCity;

  WeatherDay get today;

  BuiltList<WeatherDay> get nextDays;

  static WeatherState initial() => WeatherState(
        (b) => b
          ..currentCity = null
          ..today = WeatherDay(
            dayName: '',
            icon: Images.ic02d,
            degrees: '--',
            locationName: '',
            weatherDescription: '',
          )
          ..nextDays = ListBuilder(),
      );
}
