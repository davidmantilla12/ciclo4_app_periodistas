import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart' as fdb;
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerFirestore extends GetxController {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final CollectionReference _publicacionesRef =
      _db.collection("Publicaciones");

  CollectionReference get refPublicaciones => _publicacionesRef;

  Stream<QuerySnapshot> readItems() {
    return _publicacionesRef.snapshots();
  }

  Future<void> crearpublicacion(Map<String, dynamic> publicacion) async {
    await _db
        .collection('Publicaciones')
        .doc()
        .set(publicacion)
        .catchError((e) {
      print(e);
    });
    //return true;
  }

  Future<void> guardarubicacion(Map<String, dynamic> ubicacion, uid) async {
    await _db.collection('ubicacion').doc(uid).set(ubicacion).catchError((e) {
      print(e);
    });
    //return true;
  }

  Future<void> actualizarestado(String id, Map<String, dynamic> estados) async {
    await _db.collection('estados').doc(id).update(estados).catchError((e) {
      print(e);
    });
    //return true;
  }

  Future<void> eliminarestados(String id) async {
    await _db.collection('estados').doc(id).delete().catchError((e) {
      print(e);
    });
    //return true;
  }

  /* void eliminarPublicacion(String idpublicacion) {
    _db.collection('Publicaciones').id();
  } */
}
