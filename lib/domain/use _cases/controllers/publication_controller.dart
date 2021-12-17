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

