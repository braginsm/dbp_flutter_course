import 'package:dbp_flutter_course/models/network/responses/location_point/location_point.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationService {
  Future<LocationPoint> getLocationPoint() async {
    await _checkPermission();

    final point = await Geolocator.getCurrentPosition();

    return LocationPoint(
      lat: point.latitude,
      lon: point.longitude,
    );
  }

  Future _checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, '
        'we cannot request permissions.',
      );
    }
  }
}
