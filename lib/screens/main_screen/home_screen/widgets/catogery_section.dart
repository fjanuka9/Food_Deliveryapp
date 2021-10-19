import 'package:flutter/material.dart';
import 'package:foodapp/components/custom_image.dart';
import 'package:foodapp/components/custom_text.dart';
import 'package:foodapp/utils/app_colors.dart';

class CatogarySection extends StatelessWidget {
  const CatogarySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: const [
            CatogeryTile(
              svgName: 'all',
              catogeryName: 'All',
            ),
            CatogeryTile(
              svgName: 'pizza',
              catogeryName: 'Pizza',
            ),
            CatogeryTile(
              svgName: 'beverages',
              catogeryName: 'Beverages',
            ),
            CatogeryTile(
              svgName: 'asian',
              catogeryName: 'Asian',
            ),
          ],
        ),
      ),
    );
  }
}

class CatogeryTile extends StatefulWidget {
  const CatogeryTile({
    Key? key,
    required this.svgName,
    required this.catogeryName,
  }) : super(key: key);
  final String svgName;
  final String catogeryName;
  @override
  State<CatogeryTile> createState() => _CatogeryTileState();
}

class _CatogeryTileState extends State<CatogeryTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Container(
              width: 65,
              height: 65,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: isSelected ? korange : kwhite,
                borderRadius: BorderRadius.circular(15),
              ),
              child: CustomSvg(
                svgName: widget.svgName,
                color: isSelected ? kwhite : greycolor,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            CustomText(
              text: widget.catogeryName,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
