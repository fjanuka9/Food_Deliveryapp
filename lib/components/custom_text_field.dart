import 'package:flutter/material.dart';
import 'package:foodapp/utils/app_colors.dart';

// ignore: must_be_immutable
class CutomTextField extends StatelessWidget {
  CutomTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  var controller = TextEditingController();
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: kwhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: kwhite,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
