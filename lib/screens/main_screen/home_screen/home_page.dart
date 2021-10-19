import 'package:flutter/material.dart';
import 'package:foodapp/components/custom_header.dart';
import 'package:foodapp/components/custom_text_field.dart';
import 'package:foodapp/components/custom_title.dart';

import 'package:foodapp/screens/main_screen/home_screen/widgets/catogery_section.dart';
import 'package:foodapp/screens/main_screen/home_screen/widgets/choose_location_section.dart';
import 'package:foodapp/screens/main_screen/home_screen/widgets/nearest_restaurants.dart';
import 'package:foodapp/utils/app_colors.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainBG,
      body: Column(
        children: [
          UpperSection(size: size),
          const BottomSection(),
        ],
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ChooseLocationSection(),
            SizedBox(height: 34),
            CatogarySection(),
            SizedBox(height: 20),
            CustomTitle(text: 'Nearest Restaurents'),
            SizedBox(height: 11),
            NearestRestaurantSection(),
            SizedBox(height: 26),
            CustomTitle(text: 'Popular Restaurents'),
            SizedBox(height: 11),
            NearestRestaurantSection(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      size: size,
      image: 'top.png',
      widget: const Padding(
        padding: EdgeInsets.only(
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
    );
  }
}
