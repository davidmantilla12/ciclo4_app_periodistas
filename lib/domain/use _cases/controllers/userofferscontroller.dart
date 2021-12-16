import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart' as fdb;
import 'package:get/get.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';

class Useroffercontroller extends GetxController {
  //Controlador para reacciones
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final CollectionReference _publicacionesRef =
      _db.collection("Publicaciones");

  String _pubid = "";
  int _numcomm = 0;
  get pubid => _pubid;
  get num_comm => _numcomm;

  reaccionar(String pubid, int num_reacciones, String uid) {
    num_reacciones++;
    _publicacionesRef.doc(pubid).update({'num_reacciones': num_reacciones});
  }

  // Controlador para compartidas

  final _compartidas = 0.obs;
  int get cantcompartidas => _compartidas.value;

  compartir() {
    _compartidas.value += 1;
    _compartidas.refresh();
  }

  // Controlador para comentarios

  var _comentar = 0.obs;
  int get cantcomentarios => _comentar.value;

  setpubid(pubid) {
    _pubid = pubid;
  }

  comentar(String uid, String cuerpo, String name) {
    _publicacionesRef
        .doc(_pubid)
        .collection('Comentarios')
        .doc()
        .set({'uid_comm': uid, 'cuerpo': cuerpo, 'uname': name});
    _numcomm++;
    _publicacionesRef.doc(_pubid).update({'num_comm': _numcomm});
  }

  void setnumcomm(int num_comm) {
    _numcomm = num_comm;
  }
}
