// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/firestore.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/publication_controller.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  Controllerauth userCtrl = Get.find();
  ControllerFirestore controlFirestore = Get.find();

  final title = TextEditingController();
  final content = TextEditingController();
  final category = TextEditingController();
  final subCategory = TextEditingController();

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
            // post title
            TextFormField(
              controller: title,
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
              controller: content,
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
              controller: category,
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
              controller: subCategory,
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
              onPressed: () {
                // Make validation before add into database

                if (isPostEmpty()) {
                  print('there must be at least one field empty!');
                  showAlertEmptyFields(context);
                } else {
                  var date = '${DateTime.now().day.toString()}/' +
                             '${DateTime.now().month.toString()}/' +
                             '${DateTime.now().year.toString()}';
                             
                  final notice = <String, dynamic>{
                    'publisher': userCtrl.name,
                    'date': date,
                    'title': title.text,
                    'content': content.text,
                    'category': category.text,
                    'subCategory': subCategory.text,
                  };

                  controlFirestore.createNewNotice(notice);

                  Navigator.pop(context);
                  confirmNewPost();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  confirmNewPost() {
    Get.showSnackbar(const GetSnackBar(
      message: "Nuevo post agregado",
      duration: Duration(seconds: 3),
    ));
  }

  Future<void> showAlertEmptyFields(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 3.0,
          title: Row(
            children: const [
              Icon(Icons.announcement_rounded),
              Text('Campos incompletos'),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Los campos no estan debidamente completados.'),
                Text(
                    'Por favor asegurece de llenar toda la información e intente nuevamente.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

   isPostEmpty() {
    /// return true if all fields has been fulfilled, otherwise false
    return title.text.trim().isNotEmpty &&
           content.text.trim().isNotEmpty &&
           category.text.trim().isNotEmpty &&
           subCategory.text.trim().isNotEmpty
        ? false
        : true;
  }
}
