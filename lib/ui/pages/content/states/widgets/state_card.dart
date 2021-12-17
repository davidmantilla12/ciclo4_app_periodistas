// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:red_periodistas/ui/widgets/card.dart';

class StateCard extends StatelessWidget {
  final String name, cuerpo, uid_estado;
  final DateTime fecha;
  final VoidCallback onChat;

  // StateCard constructor
  const StateCard(
      {Key? key,
      required this.name,
      required this.cuerpo,
      required this.fecha,
      required this.uid_estado,
      required this.onChat})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return AppCard(
      title: name +
          ' (' +
          fecha.day.toString() +
          '/' +
          fecha.month.toString() +
          ' - ' +
          fecha.hour.toString() +
          ':' +
          fecha.minute.toString() +
          ')',
      content: Text(
        cuerpo,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      // topLeftWidget widget as an Avatar
      topLeftWidget: const SizedBox(
        height: 48.0,
        width: 48.0,
        child: Center(
          child: CircleAvatar(
            minRadius: 14.0,
            maxRadius: 14.0,
            backgroundImage: NetworkImage(
                'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200'),
          ),
        ),
      ),
      // topRightWidget widget as an IconButton
      topRightWidget: IconButton(
        icon: Icon(
          Icons.chat_outlined,
          color: primaryColor,
        ),
        onPressed: onChat,
      ),
    );
  }
}
