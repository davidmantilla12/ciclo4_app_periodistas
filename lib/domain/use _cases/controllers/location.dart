import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  // Observables
  final location = Rx<Position?>(null);

  double distancia(double lat, double long, double lat2, double long2) {
    double distancia = Geolocator.distanceBetween(
        lat, long, lat2, long2);
    return distancia; //Obtener la distancia del usuario respecto a mi posición
  }
}
