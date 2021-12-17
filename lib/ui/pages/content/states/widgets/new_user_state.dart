import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/firestore.dart';

class NewUserState extends StatefulWidget {
  const NewUserState({Key? key}) : super(key: key);

  @override
  _NewStateState createState() => _NewStateState();
}

class _NewStateState extends State<NewUserState> {
  TextEditingController controlpublicacion = TextEditingController();
  Controllerauth usercontroller = Get.find();
  ControllerFirestore controlfirestore = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nuevo estado',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            // post abstract
            TextFormField(
              autocorrect: true,
              maxLines: 5,
              maxLength: 500,
              controller: controlpublicacion,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  label: Text('Comparte cómo te encuentras hoy!'),
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                  hintText: '¿Qué tienes por decir?',
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
                'Publicar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              onPressed: () {
                var estado = <String, dynamic>{
                  'cuerpo': controlpublicacion.text,
                  'fecha': DateTime.now(),
                  'uid_estado': usercontroller.uid,
                  'name': usercontroller.name
                };

                controlfirestore.crearestado(estado);

                Get.showSnackbar(
                  GetBar(
                    message: "Publicación hecha",
                    duration: const Duration(seconds: 2),
                  ),
                );
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
