import 'package:flutter/material.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CutomButton extends StatelessWidget {
  const CutomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(
          key: key,
        );

  final Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primarycolor,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: fontcolorblack,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}