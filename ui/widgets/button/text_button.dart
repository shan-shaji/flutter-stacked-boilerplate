import 'package:flutter/material.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/media/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onTap;
  final TextStyle style;
  const AppTextButton({
    Key key,
    @required this.title,
    this.color,
    this.onTap,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: AppColor.primary,
      onPressed: () => onTap?.call(),
      padding: EdgeInsets.symmetric(vertical: 10.nsp),
      color: color ?? AppColor.appGreen,
      child: Center(
        child: Text(
          title,
          style: style ?? AppTextStyles.s2(color: AppColor.appBg),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
