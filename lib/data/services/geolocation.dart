import 'package:geolocator/geolocator.dart';
import 'package:red_periodistas/domain/services/location.dart';

class GpsService implements LocationInterface {
  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }
}
