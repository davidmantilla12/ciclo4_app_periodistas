import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/ui/widgets/card.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationCard extends StatelessWidget {
  final String name;
  final String uid;
  final double lat, long;
  final double? distance;
  final VoidCallback? onUpdate;

  // PostCard constructor
  const LocationCard(
      {Key? key,
      required this.name,
      required this.uid,
      required this.lat,
      required this.long,
      this.distance,
      this.onUpdate})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    final CollectionReference _usuarios =
        FirebaseFirestore.instance.collection("Usuarios");
    Color primaryColor = Theme.of(context).colorScheme.primary;

    return AppCard(
      title: name,
      // topLeftWidget widget as an Icon
      topLeftWidget: Padding(
        padding: const EdgeInsets.all(12.0),
        child: IconButton(
          icon: Icon(onUpdate != null
              ? Icons.my_location_outlined
              : Icons.near_me_outlined),
          color: primaryColor,
          onPressed: () async {
            final url = "https://www.google.es/maps?q=$lat,$long";
            await launch(url);
          },
        ),
      ),
      // topRightWidget widget as an IconButton or null

      topRightWidget: onUpdate != null
          ? IconButton(
              icon: Icon(
                Icons.sync_outlined,
                color: primaryColor,
              ),
              onPressed: () {
                onUpdate;
                
              },
            )
          : null,
      content: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Latitud:',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'Longitud:',
                style: Theme.of(context).textTheme.headline3,
              ),
              if (distance != null)
                Text(
                  'Distancia:',
                  style: Theme.of(context).textTheme.headline3,
                ),
            ],
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '$lat',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                '$long',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              if (distance != null)
                Text(
                  '$distance Km',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
            ],
          ))
        ],
      ),
    );
  }
}
