import 'package:flutter/material.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/media/app_text_styles.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final bool centerTitle;
  const CommonAppBar({
    Key key,
    @required this.title,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // elevation: 0,
      backgroundColor: AppColor.primary,
      leading: BackButton(
        color: AppColor.appBg,
      ),
      centerTitle: centerTitle,
      title: Text(
        title,
        style: AppTextStyles.s5(
            color: AppColor.appBg, fontType: FontType.SEMI_BOLD),
      ),
    );
  }
}
