import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';

enum FontType { BOLD, SEMI_BOLD, MEDIUM, REGULAR, LIGHT }

class AppTextStyles {
  static FontWeight fontType(FontType fontType) {
    switch (fontType) {
      case FontType.BOLD:
        return FontWeight.w700;
      case FontType.SEMI_BOLD:
        return FontWeight.w600;
      case FontType.MEDIUM:
        return FontWeight.w500;
      case FontType.REGULAR:
        return FontWeight.w400;
      case FontType.LIGHT:
        return FontWeight.w300;
      default:
        return FontWeight.w400;
    }
  }

  static TextStyle textStyle({
    FontType fontType,
    Color color,
    double size,
  }) {
    return TextStyle(
      color: color ?? AppColor.primary,
      fontSize: size,
      fontWeight: AppTextStyles.fontType(fontType),
    );
  }

  static TextStyle s0({Color color, FontType fontType}) =>
      AppTextStyles.textStyle(
        size: 8.nsp,
        color: color,
        fontType: fontType,
      );
  static TextStyle s1({Color color, FontType fontType}) =>
      AppTextStyles.textStyle(
        size: 10.nsp,
        color: color,
        fontType: fontType,
      );

  static TextStyle s2({Color color, FontType fontType}) =>
      AppTextStyles.textStyle(
        size: 12.nsp,
        color: color,
        fontType: fontType,
      );

  static TextStyle s3({Color color, FontType fontType}) =>
      AppTextStyles.textStyle(
        size: 14.nsp,
        color: color,
        fontType: fontType,
      );
  static TextStyle s4({Color color, FontType fontType}) =>
      AppTextStyles.textStyle(
        size: 16.nsp,
        color: color,
        fontType: fontType,
      );

  static TextStyle s5({Color color, FontType fontType}) =>
      AppTextStyles.textStyle(
        size: 18.nsp,
        color: color,
        fontType: fontType,
      );
}
