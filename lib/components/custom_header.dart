import 'package:flutter/material.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:foodapp/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.image,
    required this.header,
    required this.tagline,
    required this.size,
  }) : super(key: key);

  final Size size;
  final String image;
  final String header;
  final String tagline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Constants.imageAsset(
            image,
          ),
          width: size.width,
          fit: BoxFit.fitWidth,
        ),
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 59,
              ),
              Text(
                header,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: fontcolorblack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                tagline,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: fontcolorblack,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
