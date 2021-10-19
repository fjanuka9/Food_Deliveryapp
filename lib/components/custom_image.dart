import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodapp/utils/constants.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({
    Key? key,
    required this.svgName,
    this.color,
  }) : super(key: key);

  final String svgName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Constants.iconAssets('$svgName.svg'),
      color: color,
    );
  }
}

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
    );
  }
}
