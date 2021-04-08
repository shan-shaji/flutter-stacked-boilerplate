import 'package:flutter/material.dart';
import 'package:proficient_lawyer/app/utils/date_time_util.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/media/app_text_styles.dart';

class AppTitle extends StatelessWidget {
  final bool isUniqueTag;
  const AppTitle({
    Key key,
    this.isUniqueTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: isUniqueTag == true ? getUtcStringDate(DateTime.now()) : "appTitle",
      child: RichText(
        text: TextSpan(
          text: 'proficient ',
          style: AppTextStyles.s5(color: AppColor.appBg),
          children: <TextSpan>[
            TextSpan(
              text: 'LAWYER',
              style: AppTextStyles.s5(
                color: AppColor.appBg,
                fontType: FontType.BOLD,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
