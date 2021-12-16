import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/userofferscontroller.dart';
import 'package:red_periodistas/ui/pages/content/users_offers/widgets/new_user_comment.dart';
import 'package:red_periodistas/ui/widgets/card.dart';

class CommentCard extends StatelessWidget {
  final String uname, cuerpo, uid_comm, pubid;
  final VoidCallback onChat;
  // PostCard constructor
  const CommentCard(
      {Key? key,
      required this.pubid,
      required this.uname,
      required this.cuerpo,
      required this.uid_comm,
      required this.onChat})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    Useroffercontroller usercontroller = Get.find();
    Color primaryColor = Theme.of(context).colorScheme.primary;

    return AppCard(
      title: uname,
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
