import 'package:flutter/material.dart';
import 'widgets/offer_card.dart';

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
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
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
    );
  }
}
