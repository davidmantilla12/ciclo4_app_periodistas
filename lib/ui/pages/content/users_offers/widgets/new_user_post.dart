import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/ui/pages/content/users_offers/users_offers_screen.dart';

class NewUserPost extends StatefulWidget {
  const NewUserPost({Key? key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewUserPost> {
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
                  label: Text('¡Haz una nueva publicación!'),
                  labelStyle: TextStyle(
                    fontSize: 25.0,
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
                Get.showSnackbar(
                  GetBar(
                    message: "Publicación hecha",
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
