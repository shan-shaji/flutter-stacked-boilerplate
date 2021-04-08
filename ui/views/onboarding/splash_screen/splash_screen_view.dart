import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/widgets/title/title.dart';
import 'package:stacked/stacked.dart';

import 'splash_screen_view_model.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ScreenUtil.init(context,
        designSize: Size(screenSize.width, screenSize.height),
        allowFontScaling: false);

    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColor.primary,
        body: _Body(),
      ),
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}

class _Body extends ViewModelWidget<SplashScreenViewModel> {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, SplashScreenViewModel model) {
    return Center(
      child: AppTitle()
    );
  }
}
