import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/models/estados.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/firestore.dart';
import 'package:red_periodistas/ui/pages/content/states/widgets/new_user_state.dart';
import 'widgets/state_card.dart';

class StatesScreen extends StatefulWidget {
  // StatesScreen empty constructor
  const StatesScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<StatesScreen> {
  final items = List<String>.generate(20, (i) => "Item $i");
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
            'Nuevo\nEstado',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 11,
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewUserState()));
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
        stream: controlp.readStates(),
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
            Estado listaPublicaciones = Estado.from(document);
            return StateCard(
              name: listaPublicaciones.name,
              fecha: listaPublicaciones.fecha,
              cuerpo: listaPublicaciones.cuerpo,
              uid_estado: listaPublicaciones.uid_estado,
              onChat: () => {},
            );
          }).toList(),
        );
      }
    }
  }
}
