import 'package:cloud_firestore/cloud_firestore.dart';

class Comentario {
  String cuerpo_pub;
  String uid_comm;
  String id_publicacion;
  String uname;

  Comentario(this.cuerpo_pub, this.uid_comm, this.id_publicacion, this.uname);

  Comentario.fromJson(Map<dynamic, dynamic> json)
      : cuerpo_pub = json['cuerpo_pub'] as String,
        uid_comm = json['uid_comm'] as String,
        id_publicacion = json['id_publicacion'] as String,
        uname = json['uname'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'cuerpo_pub': cuerpo_pub,
        'uid_comm': uid_comm,
        'id_publicacion': id_publicacion,
        'uname': uname
      };

  Comentario.from(DocumentSnapshot snapshot)
      : id_publicacion = "",
        cuerpo_pub = snapshot['cuerpo'],
        uid_comm = snapshot['uid_comm'],
        uname = snapshot['uname'];
}
