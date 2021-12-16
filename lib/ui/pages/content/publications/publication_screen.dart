import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/models/notice_publication.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/firestore.dart';
import 'package:red_periodistas/ui/pages/content/publications/widgets/add_new_post.dart';
import 'package:red_periodistas/ui/pages/content/publications/widgets/post_card.dart';

class PublicOffersScreen extends StatefulWidget {
  // PublicOffersScreen empty constructor
  const PublicOffersScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<PublicOffersScreen> {
  ControllerFirestore firestoreCtrl = Get.find();
  Controllerauth userCtrl = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody(),

        // add a new post
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green[600],
          icon: const Icon(
            Icons.add_circle_outline_sharp,
            size: 50.0,
            color: Colors.white,
          ),
          label: const Text(
            'Nueva\nNoticia',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewPost()));
          },
        ));
  }

  Widget _buildBody() {
    if (firestoreCtrl.refPublicaciones == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return StreamBuilder(
        stream: firestoreCtrl.readNotice(),
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
