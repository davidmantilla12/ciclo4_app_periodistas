import 'package:cloud_firestore/cloud_firestore.dart';

class Publicacion {
  String cuerpo_pub;
  DateTime fecha_pub;
  int num_comm;
  int num_reacciones;
  int num_shares;
  String uid_pub;
  String id_publicacion;
  String uname;

  Publicacion(
      this.cuerpo_pub,
      this.fecha_pub,
      this.num_comm,
      this.num_reacciones,
      this.num_shares,
      this.uid_pub,
      this.id_publicacion,
      this.uname);

  Publicacion.fromJson(Map<dynamic, dynamic> json)
      : fecha_pub = DateTime.parse(json['fecha_pub'] as String),
        cuerpo_pub = json['cuerpo_pub'] as String,
        num_comm = json['num_comm'] as int,
        num_reacciones = json['num_reacciones'] as int,
        num_shares = json['num_shares'] as int,
        uid_pub = json['uid_pub'] as String,
        id_publicacion = json['id_publicacion'] as String,
        uname = json['uname'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'fecha_pub': fecha_pub.toString(),
        'cuerpo_pub': cuerpo_pub,
        'num_comm': num_comm,
        'num_reacciones': num_reacciones,
        'num_shares': num_shares,
        'uid_pub': uid_pub,
        'id_publicacion': id_publicacion,
        'uname': uname
      };

  Publicacion.from(DocumentSnapshot snapshot)
      : id_publicacion = snapshot.id,
        cuerpo_pub = snapshot['cuerpo_pub'],
        fecha_pub = snapshot['fecha_pub'].toDate(),
        num_comm = snapshot['num_comm'],
        num_reacciones = snapshot['num_reacciones'],
        num_shares = snapshot['num_shares'],
        uid_pub = snapshot['uid_pub'],
        uname = snapshot['uname'];
}
