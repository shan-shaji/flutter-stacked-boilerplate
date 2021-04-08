import 'package:flutter/material.dart';
import 'package:proficient_lawyer/cache.dart';
import 'package:proficient_lawyer/models/schedule.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/media/app_text_styles.dart';
import 'package:proficient_lawyer/ui/views/drawer/drawer_view.dart';
import 'package:proficient_lawyer/ui/views/fab/fab_view.dart';
import 'package:proficient_lawyer/ui/views/home/account_switcher/account_switcher_view.dart';
import 'package:proficient_lawyer/ui/views/home/calendar/calendar_view.dart';
import 'package:proficient_lawyer/ui/widgets/title/title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'home_screen_view_model.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        drawer: DrawerView(),
        floatingActionButton: FabView(),
        body: _Body(),
      ),
      viewModelBuilder: () => HomeScreenViewModel(),
    );
  }
}

class _Body extends ViewModelWidget<HomeScreenViewModel> {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeScreenViewModel model) {
    return Column(
      children: [
        _AppBar(),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            primary: true,
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 10.nsp),
              CalendarView(),
              SizedBox(height: 20.nsp),
              _Schedules(),
            ],
          ),
        ),
      ],
    );
  }
}

class _AppBar extends ViewModelWidget<HomeScreenViewModel> {
  const _AppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeScreenViewModel model) {
    return AppBar(
      // elevation: 0,
      backgroundColor: AppColor.primary,
      leading: IconButton(
          icon: Icon(Icons.sort_rounded),
          onPressed: () => model.openDrawer(context)),
      title: AppTitle(),
      actions: [
        AccountSwitcherView(),
        SizedBox(width: 10.nsp),
      ],
    );
  }
}

class _Schedules extends ViewModelWidget<HomeScreenViewModel> {
  const _Schedules({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeScreenViewModel model) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.all(20.nsp),
      children: [
        Text(
          "- Today's schedule -",
          style: AppTextStyles.s3(fontType: FontType.MEDIUM),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10.nsp,
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: false,
          itemCount: tempSchedules.length,
          itemBuilder: (_, index) {
            Schedule schedule = tempSchedules[index];
            return _ScheduleTile(
              schedule: schedule,
              onTap: () => model.gotoScheduleList(),
            );
          },
        )
      ],
    );
  }
}

class _ScheduleTile extends StatelessWidget {
  final Schedule schedule;
  final VoidCallback onTap;
  const _ScheduleTile({
    Key key,
    @required this.schedule,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Container(
        margin: EdgeInsets.only(bottom: 10.nsp),
        padding: EdgeInsets.symmetric(horizontal: 10.nsp, vertical: 15.nsp),
        decoration: BoxDecoration(
          color: AppColor.appBg,
          borderRadius: BorderRadius.circular(10.nsp),
          boxShadow: [
            BoxShadow(
              color: AppColor.appSilver.withOpacity(0.2),
              blurRadius: 2.nsp,
              offset: Offset(2.nsp, 4.nsp),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                schedule?.title,
                style: AppTextStyles.s3(),
              ),
            ),
            SizedBox(width: 10.nsp),
            Text(
              schedule?.time,
              style: AppTextStyles.s2(
                fontType: FontType.LIGHT,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
