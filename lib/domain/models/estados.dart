import 'package:cloud_firestore/cloud_firestore.dart';

class Estado {
  String cuerpo;
  DateTime fecha;
  String uid_estado;
  String id_estado;
  String name;

  Estado(this.cuerpo, this.fecha, this.uid_estado, this.id_estado, this.name);

  Estado.fromJson(Map<dynamic, dynamic> json)
      : fecha = DateTime.parse(json['fecha_pub'] as String),
        cuerpo = json['cuerpo_pub'] as String,
        uid_estado = json['uid_pub'] as String,
        id_estado = json['id_publicacion'] as String,
        name = json['uname'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'fecha': fecha.toString(),
        'cuerpo': cuerpo,
        'uid_estado': uid_estado,
        'id_estado': id_estado,
        'name': name
      };

  Estado.from(DocumentSnapshot snapshot)
      : id_estado = snapshot.id,
        cuerpo = snapshot['cuerpo'],
        fecha = snapshot['fecha'].toDate(),
        uid_estado = snapshot['uid_estado'],
        name = snapshot['name'];
}
