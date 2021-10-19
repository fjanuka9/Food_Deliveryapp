import 'package:flutter/material.dart';
import 'package:foodapp/components/custom_image.dart';
import 'package:foodapp/components/custom_text.dart';

class ChooseLocationSection extends StatelessWidget {
  const ChooseLocationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 42,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CustomSvg(
                svgName: 'location',
              ),
              const SizedBox(
                width: 13,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomText(text: 'Home'),
                  CustomText(
                    text: '242 ST Marks Eve, Finland',
                    fontSize: 14,
                  ),
                ],
              ),
            ],
          ),
          const CustomSvg(svgName: 'option'),
        ],
      ),
    );
  }
}
