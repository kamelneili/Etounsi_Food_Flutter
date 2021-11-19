import 'package:geolocator/geolocator.dart';
import 'package:kamelfoodapp/repositories/geolocation/base_geolocation_repository.dart';

class GeolocationRepository extends BaseGeolocationRepository {
  GeolocationRepository();
  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
