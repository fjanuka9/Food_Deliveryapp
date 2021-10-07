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
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
