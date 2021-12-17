import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/publication_controller.dart';

void main() async {
  // unit testing
  group('all types must be TextEditingController, otherwise i should faild',
      () {
    test('Cheking title atribute to be the correct type', () {
      // arrange
      final postCtrl = PublicationCtrl('','', '', '',);
      // act
      final title = postCtrl.title;
      // assert
      expect(title, isA<String>());
    });
    test('Cheking content atribute to be the correct type', () {
      // arrange
      final postCtrl = PublicationCtrl('','', '', '',);
      // act
      final title = postCtrl.content;
      // assert
      expect(title, isA<TextEditingController>());
    });
    test('Cheking category atribute to be the correct type', () {
      // arrange
      final postCtrl = PublicationCtrl('','', '', '',);
      // act
      final title = postCtrl.category;
      // assert
      expect(title, isA<TextEditingController>());
    });
    test('Cheking sub-category atribute to be the correct type', () {
      // arrange
      final postCtrl = PublicationCtrl('','', '', '',);
      // act
      final title = postCtrl.subCategory;
      // assert
      expect(title, isA<TextEditingController>());
    });
  });

  test(
      'given the value it should return false when field is empty, true otherwise',
      () {
    // arrange
    final postCtrl = PublicationCtrl('','', '', '',);
    // act
    final isEmpty = postCtrl.isPostEmpty();
    // assert
    expect(isEmpty, false);
  });
}
