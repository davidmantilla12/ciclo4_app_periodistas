import 'package:flutter/material.dart';
import 'package:red_periodistas/ui/pages/content/users_offers/widgets/new_user_post.dart';
import 'widgets/offer_card.dart';

class UsersOffersScreen extends StatefulWidget {
  // UsersOffersScreen empty constructor
  const UsersOffersScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<UsersOffersScreen> {
  final items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return PostCard(
              title: 'Ludvig Wiese',
              content:
                  'Duis non tellus sed quam luctus gravida quis sed libero. Pellentesque luctus lorem eu est varius, eu dignissim leo tincidunt. Fusce eget ante sed mi venenatis tincidunt et rutrum neque. Suspendisse laoreet sapien sed est aliquet fringilla. Fusce fringilla, ante in ultrices volutpat, mauris ',
              picUrl:
                  'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200',
              onChat: () => {},
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green[600],
          icon: const Icon(
            Icons.add_circle_outline_sharp,
            size: 30.0,
            color: Colors.white,
          ),
          label: const Text(
            'Nueva\nPublicación',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 11,
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewUserPost()));
          },
        ));
  }
}
