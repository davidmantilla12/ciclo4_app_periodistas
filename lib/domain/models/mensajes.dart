import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String message;
  final String date;
  final String username;
  final String uid;

  Message(this.message, this.date, this.username, this.uid);

  Message.from(DocumentSnapshot snapshot)
      : message = snapshot['message'],
        date = snapshot['date'],
        username = snapshot['username'],
        uid = snapshot['uid'];
}
