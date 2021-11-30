import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PublicationCtrl extends GetxController {

  // String? _publisher;
  // DateTime? _updateDate;
  var title = TextEditingController();
  var content = TextEditingController();
  var category = TextEditingController();
  var subCategory = TextEditingController();

  info() {
    print('publication date post: ${DateTime.now()}\n'
          'post title: ${title.text}\n'
          'post content: ${content.text}\n'
          'post category: ${category.text}\n'
          'post subcategory: ${subCategory.text}\n');
  }
}
