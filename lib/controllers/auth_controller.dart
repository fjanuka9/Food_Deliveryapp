import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodapp/components/custom_dialogbox.dart';
import 'package:foodapp/controllers/db_controller.dart';
import 'package:foodapp/screens/home_screen/home_page.dart';
import 'package:foodapp/utils/util_function.dart';

class AuthController {
  //Firebase auth instance created
  FirebaseAuth auth = FirebaseAuth.instance;

//User registration function
  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
    String name,
    String phonenumber,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .whenComplete(() async {
        await DataBaseController().saveUserData(
          name,
          phonenumber,
          email,
        );
      });
      DialogBox().dialogBox(
        context,
        DialogType.SUCCES,
        'User Account Created',
        'Congratulation, Now you can log In',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'The password provided is too weak.',
          'Please enter valid password',
        );
      } else if (e.code == 'email-already-in-use') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'The account already exists for that email.',
          'Please enter valid email',
        );
      }
    } catch (e) {
      print(e);
    }
  }

  //User login Function

  Future<void> loginUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        UtilFunction.navigateTo(context, Homepage());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'No user found for that email.',
          'Please enter valid email',
        );
      } else if (e.code == 'wrong-password') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'Wrong password provided for that user.',
          'Please enter valid password',
        );
      }
    }
  }
}
