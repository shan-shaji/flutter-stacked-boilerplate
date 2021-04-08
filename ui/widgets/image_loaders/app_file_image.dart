import 'dart:io';

import 'package:flutter/material.dart';

class AppFileImage extends StatelessWidget {
  final String filePath;
  final double width;
  final double height;
  final BoxFit fit;

  AppFileImage({
    Key key,
    @required this.filePath,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(filePath),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
