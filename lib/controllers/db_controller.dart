import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseController {
  //firestore instance create
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Create a collection refferance
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //Save user information
  Future<void> saveUserData(
    String name,
    String phonenumber,
    String email,
    String uid,
  ) {
    return users
        .doc('uid')
        .set({
          'name': name,
          'phone': phonenumber,
          'email': email,
          'uid': uid,
        })
        // ignore: avoid_print
        .then((value) => print("User Added"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to add user: $error"));
  }
}
