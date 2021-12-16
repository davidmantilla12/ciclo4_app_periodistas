import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/models/comentarios.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/firestore.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/userofferscontroller.dart';
import 'package:red_periodistas/ui/pages/content/users_offers/widgets/comm_card.dart';

class NewUserComment extends StatefulWidget {
  const NewUserComment({Key? key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewUserComment> {
  ControllerFirestore controlp = Get.find();
  Controllerauth controluser = Get.find();
  Useroffercontroller usercontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    TextEditingController controlcomentario = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nuevo comentario',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 200,
                child: _buildbody(),
              ),
              const SizedBox(height: 20.0),
              // post abstract
              TextFormField(
                autocorrect: true,
                maxLines: 3,
                maxLength: 500,
                keyboardType: TextInputType.multiline,
                controller: controlcomentario,
                decoration: const InputDecoration(
                    label: Text('¡Comenta lo que quieras!'),
                    labelStyle: TextStyle(
                      fontSize: 25.0,
                    ),
                    hintText: '¡Al comentar recuerda las normas comunitarias!',
                    hintStyle: TextStyle(color: Colors.grey)),
              ),

              const SizedBox(height: 35.0),
              FloatingActionButton.extended(
                backgroundColor: Colors.green[600],
                icon: const Icon(
                  Icons.send_rounded,
                  size: 50.0,
                  color: Colors.white,
                ),
                label: const Text(
                  'Comentar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                onPressed: () {
                  Get.showSnackbar(
                    GetBar(
                      message: "Comentario publicado",
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  usercontroller.comentar(controluser.uid,
                      controlcomentario.text, controluser.name);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildbody() {
    if (controlp.refPublicaciones
            .doc(usercontroller.pubid)
            .collection('Comentarios') ==
        null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return StreamBuilder(
        stream: controlp.readComm(usercontroller.pubid),
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
                "No hay comentarios aún, intenta hacer alguno!",
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      } else {
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            // ignore: unused_local_variable
            Comentario listaPublicaciones = Comentario.from(document);
            return CommentCard(
              uname: listaPublicaciones.uname,
              cuerpo: listaPublicaciones.cuerpo_pub,
              pubid: usercontroller.pubid,
              uid_comm: controluser.uid,
              onChat: () => {},
            );
          }).toList(),
        );
      }
    }
  }
}




/* Column(
          children: [
            const SizedBox(height: 20.0),
            // post abstract
            TextFormField(
              autocorrect: true,
              maxLines: 7,
              maxLength: 500,
              keyboardType: TextInputType.multiline,
              controller: controlcomentario,
              decoration: const InputDecoration(
                  label: Text('¡Comenta lo que quieras!'),
                  labelStyle: TextStyle(
                    fontSize: 25.0,
                  ),
                  hintText: '¡Al comentar recuerda las normas comunitarias!',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),

            const SizedBox(height: 35.0),
            FloatingActionButton.extended(
              backgroundColor: Colors.green[600],
              icon: const Icon(
                Icons.send_rounded,
                size: 50.0,
                color: Colors.white,
              ),
              label: const Text(
                'Comentar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              onPressed: () {
                Get.showSnackbar(
                  GetBar(
                    message: "Comentario publicado",
                    duration: const Duration(seconds: 2),
                  ),
                );
                usercontroller.comentar(controluser.uid,controlcomentario.text);
                Navigator.pop(context);
              },
            )
          ],
        ), */