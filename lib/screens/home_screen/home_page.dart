import 'package:flutter/material.dart';
import 'package:foodapp/components/custom_header.dart';
import 'package:foodapp/components/custom_text_field.dart';
import 'package:foodapp/utils/app_colors.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(
            size: size,
            image: 'top.png',
            widget: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 66,
              ),
              child: CutomTextField(
                hintText: 'Find your taste',
                preffix: Icon(
                  Icons.search,
                  color: greycolor,
                ),
              ),
            ),
          ),
          // SvgPicture.asset(
          //   Constants.iconAssets(
          //     'location.svg',
          //   ),
          // ),
        ],
      ),
    );
  }
}
