import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/publication_controller.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final publicationCtrl = Get.put(PublicationCtrl());

  @override
  Widget build(BuildContext context) {
    // TODO: get and handle data from new post view
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
            // post title
            TextFormField(
              controller: publicationCtrl.title,
              autofocus: true,
              maxLength: 100,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  label: Text('Título'),
                  labelStyle: TextStyle(
                    fontSize: 25.0,
                  ),
                  hintText: 'Agrega el título de tu post',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),

            const SizedBox(height: 20.0),
            // post content
            TextFormField(
              controller: publicationCtrl.content,
              autocorrect: true,
              maxLines: 7,
              maxLength: 500,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  label: Text('Resumen'),
                  labelStyle: TextStyle(
                    fontSize: 25.0,
                  ),
                  hintText: 'Agrega una breve descripción de la notícia',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),

            // post category
            const SizedBox(height: 20.0),
            TextFormField(
              controller: publicationCtrl.category,
              autofocus: true,
              maxLength: 50,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  label: Text('Categoria'),
                  labelStyle: TextStyle(
                    fontSize: 25.0,
                  ),
                  hintText: 'Ej: deportes, tecnología, politica, etc',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),

            // post sub-category
            const SizedBox(height: 20.0),
            TextFormField(
              controller: publicationCtrl.subCategory,
              autofocus: true,
              maxLength: 50,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  label: Text('Sub-Categoria'),
                  labelStyle: TextStyle(
                    fontSize: 25.0,
                  ),
                  hintText: 'Ej: electronica, espacio, IA, etc',
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

              // TODO: implement add category controller
              onPressed: () {
                publicationCtrl.info();
              },
            )
          ],
        ),
      ),
    );
  }
}
