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
  final items = List<String>.generate(21, (i) => "Item $i");

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
    return Scaffold(
      body: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return StateCard(
          title: textoChat,
          content: 'hi I am a journalist for the Circilo de periodistas'
                   'valledupar and I love using Query News',
                   
          picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
          onChat: () => {},
        );
      },
    ),
      bottomSheet: Row(
        children: [
          Container(
            height: 50.0,
            width: 400.0,
            child: TextFormField(
              style: const TextStyle(
                fontSize: 18.0,
              ),
              autofocus: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.chat_outlined,
                  color: Colors.orangeAccent,
                  
                  ),
                hintText: 'chatea en vivo',
                border: UnderlineInputBorder(),
                
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.send,size: 40.0,)),
        ],
      ),

    );
  }
}
