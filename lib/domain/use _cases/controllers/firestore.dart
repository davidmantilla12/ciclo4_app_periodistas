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

  static final CollectionReference _statesRef = _db.collection("Estados");

  static final CollectionReference _noticeRef =
      _db.collection("notice_publication");

  static final CollectionReference _messageRef = _db.collection('messages');

  CollectionReference get refPublicaciones => _publicacionesRef;

  CollectionReference get refState => _statesRef;

  CollectionReference get noticeRef => _noticeRef;

  CollectionReference get messageRef => _messageRef;

  Stream<QuerySnapshot> readItems() {
    return _publicacionesRef.snapshots();
  }

  Stream<QuerySnapshot> readStates() {
    return _statesRef.snapshots();
  }

  Stream<QuerySnapshot> readNotice() {
    return _noticeRef.snapshots();
  }

  Stream<QuerySnapshot> readMessage() {
    return _messageRef.snapshots();
  }

  Future createNewNotice(Map<String, dynamic> newNotice) async {
    await _noticeRef.doc().set(newNotice).catchError((e) {
      print(e.toString());
    });
  }

  Future createNewMessage(Map<String, dynamic> newMessage) async {
    await _messageRef.doc().set(newMessage).catchError((e) {
      print(e.toString());
    });
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

  Future<void> crearestado(Map<String, dynamic> estado) async {
    await _db.collection('Estados').doc().set(estado).catchError((e) {
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
