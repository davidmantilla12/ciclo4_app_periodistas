import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PublicationCtrl extends GetxController {
  final title;
  final content;
  final category;
  final subCategory;

  PublicationCtrl(this.title, this.content, this.category, this.subCategory);

  isPostEmpty() {
    /// return true if all fields has been fulfilled, otherwise false
    return title.text.trim().isNotEmpty &&
            content.text.trim().isNotEmpty &&
            category.text.trim().isNotEmpty &&
            subCategory.text.trim().isNotEmpty
        ? false
        : true;
  }

  clearFields() {
    title.clear();
    content.clear();
    category.clear();
    subCategory.clear();
  }
}

class FirebaseConnection {
  getUser() async {
    CollectionReference publicationCol =
        FirebaseFirestore.instance.collection('notice_publication');

    // publicationCol.doc().set({
    //   'publisher': 'Camilo',
    //   'date': DateTime.now(),
    //   'title': 'A title',
    //   'abstract': 'the abstract',
    //   'category': 'the category',
    //   'sub_category': 'the sub_category',
    // });

    QuerySnapshot notices = await publicationCol.get();
    var hola = publicationCol.snapshots();

    if (notices.docs.length != 0) {
      for (var item in notices.docs) {
        var name = item.data();
        print(name);
        print(item.data());
      }
      hola.forEach((element) {
        print(element.docs);
      });
    } else {
      print('there is not values in database');
    }
  }
}
