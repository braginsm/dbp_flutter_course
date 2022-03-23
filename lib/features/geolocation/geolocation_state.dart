library geolocation_state;

import 'package:built_value/built_value.dart';
import 'package:dbp_flutter_course/models/network/responses/location_point/location_point.dart';

part 'geolocation_state.g.dart';

abstract class GeolocationState
    implements Built<GeolocationState, GeolocationStateBuilder> {
  factory GeolocationState([void Function(GeolocationStateBuilder b) updates]) =
      _$GeolocationState;

  GeolocationState._();

  LocationPoint? get point;

  static GeolocationState initial() => GeolocationState((b) => b..point = null);
}
