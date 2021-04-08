import 'package:flutter/material.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';

Widget customProgressIndicator({color = AppColor.primary}) {
  return Center(
      child: CircularProgressIndicator(
    valueColor: new AlwaysStoppedAnimation<Color>(color),
  ));
}
