import 'package:flutter/material.dart';
import 'package:red_periodistas/ui/widgets/card.dart';

class OfferCard extends StatelessWidget {
  final String publisher, title, content, category, subCategory, date;

  // OfferCard constructor
  const OfferCard({
    Key? key,
    required this.publisher,
    required this.title,
    required this.content,
    required this.category,
    required this.date,
    required this.subCategory,
  }) : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return AppCard(
      title: '$title | por: $publisher',
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyText1,
      ),

      extraContent: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.category_rounded,
                  color: primaryColor,
                ),
              ),
              Column(
                children: [
                  Text(
                    '- $category',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    '- $subCategory',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
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
                date,
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
