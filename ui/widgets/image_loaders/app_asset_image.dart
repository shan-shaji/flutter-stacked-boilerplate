import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType { PNG, JPG, SVG }

class AppAssetImage extends StatelessWidget {
  final ImageType imageType;
  final String imagePath;
  final Color color;
  final double width;
  final double height;
  final BoxFit fit;

  AppAssetImage({
    Key key,
    @required this.imageType,
    @required this.imagePath,
    this.color,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case ImageType.SVG:
        return SvgPicture.asset(
          imagePath,
          color: color,
          width: width,
          height: height,
          fit: fit,
        );
      default:
        return Image.asset(
          imagePath,
          color: color,
          width: width,
          height: height,
          fit: fit,
        );
    }
  }
}
