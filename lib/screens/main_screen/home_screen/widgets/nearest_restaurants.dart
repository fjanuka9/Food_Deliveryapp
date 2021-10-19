import 'package:flutter/material.dart';
import 'package:foodapp/components/custom_image.dart';
import 'package:foodapp/components/custom_text.dart';
import 'package:foodapp/utils/app_colors.dart';

class NearestRestaurantSection extends StatelessWidget {
  const NearestRestaurantSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: const [
            RestaurantTile(
              isOffer: true,
            ),
            RestaurantTile(),
            RestaurantTile(),
            RestaurantTile(),
          ],
        ),
      ),
    );
  }
}

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    Key? key,
    this.isOffer = false,
  }) : super(key: key);
  final bool isOffer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120,
          height: 120,
          margin: const EdgeInsets.only(right: 20),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: const CustomNetworkImage(
                  url:
                      'https://www.kitchensanctuary.com/wp-content/uploads/2020/12/Quick-Chicken-Ramen-square-FS-22.jpg',
                ),
              ),
              isOffer ? const OfferTag() : Container(),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const CustomText(
          text: 'Westway',
          fontSize: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.star,
                  color: primarycolor,
                  size: 15,
                ),
                CustomText(
                  text: '4.6  • ',
                  fontSize: 12,
                ),
              ],
            ),
            const Icon(
              Icons.timer,
              color: greycolor,
              size: 15,
            ),
            const SizedBox(
              width: 4,
            ),
            const CustomText(
              text: '15 min',
              fontSize: 12,
            ),
          ],
        ),
      ],
    );
  }
}

class OfferTag extends StatelessWidget {
  const OfferTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: 79,
        height: 28,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: korange,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              15,
            ),
            bottomRight: Radius.circular(
              15,
            ),
            topRight: Radius.circular(
              15,
            ),
          ),
        ),
        child: const CustomText(
          text: '50% OFF',
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: kwhite,
        ),
      ),
    );
  }
}
