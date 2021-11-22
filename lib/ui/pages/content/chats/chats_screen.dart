import 'package:flutter/material.dart';
import 'widgets/chat_card.dart';

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
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return StateCard(
          title: 'Iony Houst',
          content: 'Lorem ipsum dolor sit amet.',
          picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
          onChat: () => {},
        );
      },
    );
  }
}
