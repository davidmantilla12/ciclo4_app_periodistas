import 'package:flutter/material.dart';
import 'widgets/chat_card.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/chats_controller.dart';

class ChatsScreen extends StatefulWidget {
  // StatesScreen empty constructor
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ChatsScreen> {
  final items = List<String>.generate(2, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    chatscontroller controladorChats = Get.find();

    controladorChats.leermensajesPendientes();

    var textoChat = "Iony Houst";
    if (controladorChats.cantmensajes.toInt() > 0) {
      textoChat += " (" +
          controladorChats.cantmensajes.toString() +
          " Mensajes sin leer)";
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return StateCard(
          title: textoChat,
          content: 'Lorem ipsum dolor sit amet.',
          picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
          onChat: () => {},
        );
      },
    );
  }
}
