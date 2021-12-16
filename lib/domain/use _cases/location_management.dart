import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/data/services/geolocation.dart';

class LocationManager {
  final gpsService = GpsService();

  Future<Position> getCurrentLocation() async {
    return await gpsService.getCurrentLocation();
  }
}
