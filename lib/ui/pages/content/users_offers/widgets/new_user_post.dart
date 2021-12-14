import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/firestore.dart';

class NewUserPost extends StatefulWidget {
  const NewUserPost({Key? key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewUserPost> {
  TextEditingController controlpublicacion = TextEditingController();
  Controllerauth usercontroller = Get.find();
  ControllerFirestore controlfirestore = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nueva publicación',
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
                  label: Text('¡Haz una nueva publicación!'),
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
                var publicacion = <String, dynamic>{
                  'cuerpo_pub': controlpublicacion.text,
                  'fecha_pub': DateTime.now(),
                  'num_comm': 0,
                  'num_reacciones': 0,
                  'num_shares': 0,
                  'uid_pub': usercontroller.uid,
                  'uname': usercontroller.name
                };

                controlfirestore.crearpublicacion(publicacion);

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
