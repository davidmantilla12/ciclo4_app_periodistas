import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/userofferscontroller.dart';
import 'package:red_periodistas/ui/pages/content/users_offers/widgets/new_user_comment.dart';
import 'package:red_periodistas/ui/widgets/card.dart';

class PostCard extends StatelessWidget {
  final String title, content, picUrl;
  final VoidCallback onChat;

  // PostCard constructor
  const PostCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.picUrl,
      required this.onChat})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    Useroffercontroller usercontroller = Get.find();
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return AppCard(
      title: title,
      content: Text(
        content,
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
            backgroundImage: NetworkImage(picUrl),
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

      extraContent: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  icon: Icon(
                    Icons.comment_bank_outlined,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewUserComment()));
                  },
                ),
              ),
              Obx(() => Text(
                    usercontroller.cantcomentarios.toString(),
                    style: Theme.of(context).textTheme.caption,
                  )),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  icon: Icon(
                    Icons.thumb_up_alt_outlined,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    usercontroller.reaccionar();
                  },
                ),
              ),
              Obx(() => Text(
                    usercontroller.cantreacciones.toString(),
                    style: Theme.of(context).textTheme.caption,
                  )),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  icon: Icon(Icons.share, color: primaryColor),
                  onPressed: () {
                    Get.showSnackbar(
                      GetBar(
                        message: "Publicación compartida",
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    usercontroller.compartir();
                  },
                ),
              ),
              Obx(() => Text(
                    usercontroller.cantcompartidas.toString(),
                    style: Theme.of(context).textTheme.caption,
                  )),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
