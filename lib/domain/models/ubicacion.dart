import 'package:cloud_firestore/cloud_firestore.dart';

class Ubicacion {
  final num latitud;
  final num longitud;
  final String name;
  final String uid;
  final double distancia;

  Ubicacion(this.latitud, this.longitud, this.name, this.uid, this.distancia);

  Ubicacion.fromJson(Map<dynamic, dynamic> json)
      : latitud = json['lat'] as double,
        longitud = json['lon'] as double,
        name = json['name'] as String,
        uid = json['uid'] as String,
        distancia = json['distancia'] as double;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'lat': latitud,
        'lon': longitud,
        'name': name,
        'uid': uid,
        'distancia': distancia
      };

  Ubicacion.from(DocumentSnapshot snapshot)
      : uid = snapshot.id,
        name = snapshot['nombre'],
        latitud = snapshot['latitud'],
        longitud = snapshot['longitud'],
        distancia = 0;
}
