import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  int score;
  String uerID;
  String email;

  User();

  User.fromSnapshot(DocumentSnapshot snapshot) {

    name = snapshot.data['name'];
    score = snapshot.data['score'];
    uerID = snapshot.data['uerID'];
    email = snapshot.data['email'];

  }
}
