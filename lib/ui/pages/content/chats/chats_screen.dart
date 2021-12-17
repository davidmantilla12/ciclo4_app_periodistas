import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:red_periodistas/domain/models/mensajes.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/firestore.dart';
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
  Controllerauth userCtrl = Get.find();
  ControllerFirestore firestoreCtrl = Get.find();
// TODO: delete this after getting messages from database
  final items = List<String>.generate(21, (i) => "Item $i");

  TextEditingController inputMessage = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 55.0),
        child: _buildBody(),
      ),
      bottomSheet: Row(
        children: [
          SizedBox(
            width: 310.0,
            child: TextFormField(
              minLines: 1,
              maxLines: 5,
              scrollController: ScrollController(),
              controller: inputMessage,
              style: const TextStyle(
                fontSize: 18.0,
              ),
              autofocus: true,
              decoration: const InputDecoration(
                prefixIcon:
                    Icon(Icons.chat_outlined, color: Colors.deepPurpleAccent),
                hintText: 'chatea en vivo',
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                if(inputMessage.text.isNotEmpty) {
                  var date = '${DateTime.now().day.toString()}/'
                             '${DateTime.now().month.toString()}/'
                             '${DateTime.now().year.toString()}';
                             
                  final message = <String, dynamic>{
                    'username': userCtrl.name,
                    'uid': userCtrl.uid,
                    'date': date,
                    'message': inputMessage.text,
                  };

                  firestoreCtrl.createNewMessage(message);
                  inputMessage.clear();
                }
              },
              icon: const Icon(
                Icons.send,
                size: 40.0,
              )),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (firestoreCtrl.refPublicaciones == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return StreamBuilder(
        stream: firestoreCtrl.readMessage(),
        builder: _buildList,
      );
    }
  }

  Widget _buildList(
      BuildContext buildContext, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (snapshot.data!.docs.isEmpty) {
        return Center(
          child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'No hay mensajes aún, se el primero en '
                'comunicarte con nuestra comunidad',
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      } else {
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Message messagesList = Message.from(document);
            return StateCard(
              username: messagesList.username,
              message: messagesList.message,
              date: messagesList.date,
              isUserMessage: messagesList.uid == userCtrl.uid,
            );
          }).toList(),
        );
      }
    }
  }
}
