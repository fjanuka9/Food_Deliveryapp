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
  ) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'name': name,
          'phone': phonenumber,
          'email': email,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
