import 'package:flutter/material.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:foodapp/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.size,
    required this.image,
    this.header,
    this.tagline,
    this.widget,
  }) : super(key: key);

  final Size size;
  final String image;
  final String? header;
  final String? tagline;
  final Widget? widget;

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
        widget == null
            ? Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 59,
                    ),
                    Text(
                      header ?? "",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: kblack,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      tagline ?? "",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: kblack,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            : widget!,
      ],
    );
  }
}
