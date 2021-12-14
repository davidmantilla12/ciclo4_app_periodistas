import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/firestore.dart';

class PublicacionWidget extends StatelessWidget {
  final String cuerpo_pub;
  final DateTime fecha_pub;
  final int num_comm;
  final int num_reacciones;
  final int num_shares;
  final String uid_pub;
  final String id_publicacion;
  PublicacionWidget(this.cuerpo_pub, this.fecha_pub, this.num_comm,
      this.num_reacciones, this.num_shares, this.uid_pub, this.id_publicacion);

  @override
  Widget build(BuildContext context) {
    ControllerFirestore controlpublicaciones = Get.find();
    Controllerauth controluser = Get.find();
    return Padding(
      padding: const EdgeInsets.only(left: 1, top: 5, right: 1, bottom: 2),
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(
            radius: 15,
            backgroundImage: const NetworkImage(
                'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200'),
          ),
          title: Text(cuerpo_pub),
          subtitle: Text(uid_pub),
          trailing: Text(DateFormat('kk:mma').format(fecha_pub).toString()),
        ),
        Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey[350]!,
                  blurRadius: 2.0,
                  offset: Offset(0, 1.0))
            ], borderRadius: BorderRadius.circular(50.0), color: Colors.white),
            child: MaterialButton(
                disabledTextColor: Colors.black87,
                padding: EdgeInsets.only(left: 18),
                onPressed: null,
                onLongPress: () {
                  /* if (controluser.uid == uid_pub) {
                    controlpublicaciones.eliminarPublicacion(id_publicacion);
                  } */
                },
                child: Wrap(
                  children: <Widget>[
                    Container(
                        child: Row(
                      mainAxisAlignment: (controluser.uid == uid_pub)
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Text(cuerpo_pub),
                      ],
                    ))
                  ],
                ))),
        Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Align(
                alignment: Alignment.topRight,
                child: Text(
                    controluser.uid +
                        '-' +
                        DateFormat('kk:mma, dd-MM-yyyyy')
                            .format(fecha_pub)
                            .toString(),
                    style: TextStyle(color: Colors.grey))))
      ]),
    );
  }
}
