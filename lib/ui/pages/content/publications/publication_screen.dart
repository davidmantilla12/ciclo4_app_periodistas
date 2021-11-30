import 'package:flutter/material.dart';
import 'package:red_periodistas/ui/pages/content/publications/widgets/add_new_post.dart';
import 'package:red_periodistas/ui/pages/content/publications/widgets/post_card.dart';

class PublicOffersScreen extends StatefulWidget {
  // PublicOffersScreen empty constructor
  const PublicOffersScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<PublicOffersScreen> {
  final items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            // TODO: it should render all publications that have been made
            return OfferCard(
              title:
                  'Conozca los nuevos tiempos de la convocatoria para el programa “Misión TIC 2022”',
              content:
                  'El Ministerio de Tecnologías de la Información y las Comunicaciones, informa a todos los interesados en participar de la convocatoria de la ruta de aprendizaje 1 y 2, la modificación del cronograma.',
              source: 'Emisora Ondas de Ibagué',
              fecha: "20/11/2021",
              enlace:
                  "http://www.ondasdeibague.com/noticias/nacionales/40422-conozca-los-nuevos-tiempos-de-la-convocatoria-para-el-programa-mision-tic-2022",
              onCopy: () => {},
              onApply: () => {},
            );
          },
        ),

        // add a new post
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green[600],
          icon: const Icon(
            Icons.add_circle_outline_sharp,
            size: 50.0,
            color: Colors.white,
          ),
          label: const Text(
            'Nueva\nPublicación',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),

          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const NewPost()));
          },
        ));
  }
}
