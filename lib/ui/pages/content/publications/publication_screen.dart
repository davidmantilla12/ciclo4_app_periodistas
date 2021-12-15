import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/models/notice_publication.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/firestore.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/publication_controller.dart';
import 'package:red_periodistas/ui/pages/content/publications/widgets/add_new_post.dart';
import 'package:red_periodistas/ui/pages/content/publications/widgets/post_card.dart';

class PublicOffersScreen extends StatefulWidget {
  // PublicOffersScreen empty constructor
  const PublicOffersScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<PublicOffersScreen> {
  ControllerFirestore controlp = Get.find();
  Controllerauth controluser = Get.find();

  final items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildbody(),

        // add a new post
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green[600],
          icon: const Icon(
            Icons.add_circle_outline_sharp,
            size: 50.0,
            color: Colors.white,
          ),
          label: const Text(
            'Nueva\nPublicación',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewPost()));

            FirebaseConnection fbc = FirebaseConnection();

            fbc.getUser();
          },
        ));
  }

  Widget _buildbody() {
    if (controlp.refPublicaciones == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return StreamBuilder(
        stream: controlp.readNotice(),
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
                "Aun no hay noticias, intenta hacer alguna!",
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      } else {
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            // ignore: unused_local_variable
            Notice noticeList = Notice.from(document);
            return OfferCard(
              publisher: noticeList.publisher,
              date: noticeList.date,
              title: noticeList.title,
              content: noticeList.content,
              category: noticeList.category,
              subCategory: noticeList.subCategory,
            );
          }).toList(),
        );
      }
    }
  }
}
