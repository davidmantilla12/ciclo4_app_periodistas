import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/models/publicaciones.dart';
import 'package:red_periodistas/domain/models/ubicacion.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/firestore.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/location.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/permissions.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/userofferscontroller.dart';
import 'package:red_periodistas/domain/use%20_cases/location_management.dart';
import 'package:red_periodistas/ui/pages/content/location/widgets/location_card.dart';

class GpsScreen extends StatefulWidget {
  const GpsScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

enum RadioState { on, off }

class _State extends State<GpsScreen> {
  late PermissionsController permissionsController;
  late LocationController locationController;
  late LocationManager manager;
  ControllerFirestore controlp = Get.find();
  Controllerauth controluser = Get.find();
  Useroffercontroller useroffercontroller = Get.find();
  double latitud = 0;
  double longitud = 0;
  final CollectionReference _usuarios =
      FirebaseFirestore.instance.collection("Usuarios");

  actualizarUbicacion() async {
    locationController.location.value = null;
    if (permissionsController.locationGranted) {
      final position = await manager.getCurrentLocation();
      locationController.location.value = position;
    }
  }

  @override
  void initState() {
    super.initState();
    permissionsController = Get.find();
    locationController = Get.find();
    manager = LocationManager();
  }

  @override
  Widget build(BuildContext context) {
    actualizarUbicacion();
    return Column(
      children: [
        Obx(() => LocationCard(
              name: controluser.name,
              uid: controluser.uid,
              onUpdate: locationController.location.value != null
                  ? () async {
                      final position = locationController.location.value;
                      final url =
                          "https://www.google.es/maps?q=${position?.latitude.toPrecision(5)},${position?.longitude.toPrecision(5)}";
                      _usuarios.doc(controluser.uid).update({
                        'latitud': position?.latitude,
                        'longitud': position?.longitude
                      }).onError((error, stackTrace) => Get.snackbar('Error',
                          'Error al actualizar la ubicacion en la base de datos'));
                      await Get.snackbar('Ubicación actualizada', '');
                    }
                  : null,
              lat: locationController.location.value != null
                  ? locationController.location.value!.latitude.toPrecision(5)
                  : 0,
              long: locationController.location.value != null
                  ? locationController.location.value!.longitude.toPrecision(5)
                  : 0,
            )),

        //Constructor de listado
        Expanded(child: _buildbody()),
      ],
    );
  }

  Widget _buildbody() {
    if (controluser.usuariosref == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return StreamBuilder(
        stream: controluser.readUserItems(),
        builder: _buildList,
      );
    }
  }

  Widget _buildList(
      BuildContext buildContext, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (snapshot.data!.docs.isEmpty) {
        return Center(
          child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "No hay ubicaciones aún, intenta hacer alguna!",
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      } else {
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            // ignore: unused_local_variable
            Ubicacion listaUbicaciones = Ubicacion.from(document);
            manager.getCurrentLocation();
            double lat = locationController.location.value != null
                ? locationController.location.value!.latitude
                : 0;
            double long = locationController.location.value != null
                ? locationController.location.value!.longitude
                : 0;

            double distancia = locationController.distancia(
                    lat,
                    long,
                    listaUbicaciones.latitud.toDouble(),
                    listaUbicaciones.longitud.toDouble()) /
                1000;

            return listaUbicaciones.uid != controluser.uid
                ? LocationCard(
                    name: listaUbicaciones.name,
                    uid: listaUbicaciones.uid,
                    lat: listaUbicaciones.latitud.toDouble(),
                    long: listaUbicaciones.longitud.toDouble(),
                    distance: distancia,
                  )
                : const Text("");
          }).toList(),
        );
      }
    }
  }
}
