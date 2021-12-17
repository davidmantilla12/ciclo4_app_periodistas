import 'dart:math';

import 'package:flutter/material.dart';
import 'package:red_periodistas/ui/widgets/card.dart';

class StateCard extends StatelessWidget {
  final String username, message, date;
  final bool isUserMessage;

  // StateCard constructor
  const StateCard(
      {Key? key,
      required this.username,
      required this.message,
      required this.date,
      required this.isUserMessage})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    // Color primaryColor = Theme.of(context).colorScheme.primary;
    return AppCard(
      cardColor: setCardColor(),
      cardMargin: setCardMargin(),
      title: showUsername(),
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      // topLeftWidget widget as an Avatar
      topLeftWidget: SizedBox(
        height: 48.0,
        width: 48.0,
        child: Center(
          child: CircleAvatar(
            minRadius: 14.0,
            maxRadius: 14.0,
            backgroundColor: Color.fromARGB(
                circleAvatarColor(256, 200),
                circleAvatarColor(256, 0),
                circleAvatarColor(256, 0),
                circleAvatarColor(256, 0)),
          ),
        ),
      ),
      extraContent: Container(
        alignment: Alignment.bottomRight,
        child: Text(date, 
            style: const TextStyle(
              fontSize: 12.0
            ),
          ),
      ),
    );
  }

  // required functions
  showUsername() {
    return isUserMessage ? 'Tú' : username;
  }

  circleAvatarColor(int max, int min) {
    var rn = Random();
    return rn.nextInt(max) + min;
  }

  setCardColor() {
    return isUserMessage ? Colors.indigoAccent : null;
  }

  setCardMargin() {
    return isUserMessage
        ? const EdgeInsets.fromLTRB(50.0, 5.0, 0.0, 5.0)
        : const EdgeInsets.fromLTRB(5.0, 5.0, 50.0, 5.0);
  }
}
