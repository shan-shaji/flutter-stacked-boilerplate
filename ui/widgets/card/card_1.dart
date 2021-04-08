import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';

class AppCard1 extends StatelessWidget {
  final Widget child;

  AppCard1({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.nsp, vertical: 15.nsp),
      decoration: BoxDecoration(
        color: AppColor.appBg,
        borderRadius: BorderRadius.circular(10.nsp),
        boxShadow: [
          BoxShadow(
            color: AppColor.appSilver.withOpacity(0.2),
            blurRadius: 4.nsp,
            spreadRadius: 4.nsp,
            offset: Offset(2.nsp, 4.nsp),
          ),
        ],
      ),
      child: child,
    );
  }
}
