import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;

  AppNetworkImage({
    Key key,
    @required this.url,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      width: width,
      height: height,
      fit: fit,
      cache: true,
      clearMemoryCacheWhenDispose: true,
      clearMemoryCacheIfFailed: true,
      timeRetry: Duration(milliseconds: 1300),
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.completed:
            return null;
            break;
          default:
            return Container(
              width: width,
              height: height,
              color: AppColor.appSilver,
            );
            break;
        }
      },
    );
  }
}
