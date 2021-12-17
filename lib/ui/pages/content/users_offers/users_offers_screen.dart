import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/models/publicaciones.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/firestore.dart';
import 'package:red_periodistas/ui/pages/content/users_offers/widgets/new_user_post.dart';
import 'widgets/offer_card.dart';

class UsersOffersScreen extends StatefulWidget {
  const UsersOffersScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<UsersOffersScreen> {
  ControllerFirestore controlp = Get.find();
  Controllerauth controluser = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildbody(),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green[600],
          icon: const Icon(
            Icons.add_circle_outline_sharp,
            size: 30.0,
            color: Colors.white,
          ),
          label: const Text(
            'Nueva\nPublicación',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 11,
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewUserPost()));
          },
        ));
  }

  Widget _buildbody() {
    if (controlp.refPublicaciones == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return StreamBuilder(
        stream: controlp.readItems(),
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
                "No hay publicaciones aún, intenta hacer alguna!",
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      } else {
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            // ignore: unused_local_variable
            Publicacion listaPublicaciones = Publicacion.from(document);
            return PostCard(
              title: listaPublicaciones.uname,
              content: listaPublicaciones.cuerpo_pub,
              fecha: listaPublicaciones.fecha_pub,
              picUrl:
                  'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200',
              onChat: () => {},
            );
          }).toList(),
        );
      }
    }
  }
}
