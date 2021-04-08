import 'package:flutter/material.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DottedLoadingIndicator extends StatelessWidget {
  final bool isVisible;

  const DottedLoadingIndicator({
    Key key,
    @required this.isVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Center(
        child: JumpingDotsProgressIndicator(
          color: AppColor.primary,
          dotSpacing: 0,
          fontSize: 80.nsp,
        ),
      ),
    );
  }
}
