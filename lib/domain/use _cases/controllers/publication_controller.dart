import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PublicationCtrl extends GetxController {

  // String? _publisher;
  // DateTime? _updateDate;
  final _title = TextEditingController();
  final _content = TextEditingController();
  final _category = TextEditingController();
  final _subCategory = TextEditingController();

  get title => _title;
  get content => _content;
  get category => _category;
  get subCategory => _subCategory;

  isPostEmpty() {
    /// return true if all fields has been fulfilled, otherwise false
    return _title.text.trim().isNotEmpty &&
           _content.text.trim().isNotEmpty &&
           _category.text.trim().isNotEmpty &&
           _subCategory.text.trim().isNotEmpty ?
           false :
           true;
  }

  clearFields() {
    _title.clear();
    _content.clear();
    _category.clear();
    _subCategory.clear();
  }


  info() {

    var text = _title.text;
    print('post publication date: ${DateTime.now()}\n'
          'post title: ${_title.text.trim()}\n'
          'post content: ${_content.text.trim()}\n'
          'post category: ${_category.text.trim()}\n'
          'post subcategory: ${_subCategory.text.trim()}\n');
  }
}
