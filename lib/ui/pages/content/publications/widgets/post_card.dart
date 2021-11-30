import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/ui/widgets/card.dart';

class OfferCard extends StatelessWidget {
  final String title, content, source, fecha, enlace;
  final VoidCallback onCopy, onApply;

  // OfferCard constructor
  const OfferCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.source,
      required this.fecha,
      required this.enlace,
      required this.onCopy,
      required this.onApply})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return AppCard(
      title: title,
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      // topRightWidget widget as an IconButton
      topRightWidget: IconButton(
        icon: Icon(
          Icons.copy_outlined,
          color: primaryColor,
        ),
        onPressed: () {
          Clipboard.setData(ClipboardData(text: enlace));
          Get.showSnackbar(
            GetBar(
              message: "Se ha copiado el enlace de la noticia al portapapeles.",
              duration: const Duration(seconds: 2),
            ),
          );
        },
      ),
      // extraContent widget as a column that contains more details about the offer
      // and an extra action (onApply)
      extraContent: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.source_outlined,
                  color: primaryColor,
                ),
              ),
              Text(
                source,
                style: Theme.of(context).textTheme.caption,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.date_range_outlined,
                  color: primaryColor,
                ),
              ),
              Text(
                fecha,
                style: Theme.of(context).textTheme.caption,
              ),
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