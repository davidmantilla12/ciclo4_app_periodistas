import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/userofferscontroller.dart';

class NewUserComment extends StatefulWidget {
  const NewUserComment({Key? key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewUserComment> {
  @override
  Widget build(BuildContext context) {
    Useroffercontroller usercontroller = Get.find();
    
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
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            // post abstract
            TextFormField(
              autocorrect: true,
              maxLines: 7,
              maxLength: 500,
              keyboardType: TextInputType.multiline,
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
                usercontroller.comentar();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
