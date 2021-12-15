import 'package:cloud_firestore/cloud_firestore.dart';


class Notice {
  final String publisher;
  final String date;
  final String title;
  final String content;
  final String category;
  final String subCategory;

  Notice(this.publisher,
         this.date,
         this.title,
         this.content,
         this.category,
         this.subCategory);

//   No required for this app but still useful

  // Notice.fromJson(Map<dynamic, dynamic> json)
  //     : publisher = json['publisher'] as String,
  //       date = json['date'] as String,
  //       title = json['title'] as String,
  //       content = json['content'] as String,
  //       category = json['category'] as String,
  //       subCategory = json['subCategory'] as String;


  // Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
  //       'publisher': publisher,
  //       'date': date.toString(),
  //       'title': title,
  //       'content': content,
  //       'category': category,
  //       'subCategory': subCategory,
  //     };

  Notice.from(DocumentSnapshot snapshot)
      : publisher = snapshot['publisher'],
        date = snapshot['date'].toString(),
        title = snapshot['title'],
        content = snapshot['content'],
        category = snapshot['category'],
        subCategory = snapshot['subCategory'];
}

