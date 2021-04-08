import 'package:flutter/material.dart';
import 'package:inline_calender/inline_calender.dart';
import 'package:proficient_lawyer/app/utils/toast_util.dart';
import 'package:proficient_lawyer/cache.dart';
import 'package:proficient_lawyer/models/schedule.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/media/app_text_styles.dart';
import 'package:proficient_lawyer/ui/views/schedules/schedules_screen_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleScreenView extends StatelessWidget {
  const ScheduleScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SchedulesScreenViewModel>.reactive(
      onModelReady: (model) => model.initState(),
      builder: (context, model, child) => Scaffold(
        appBar: _scheduleAppBar(
          model: model,
          title: "Schedules",
        ),
        body: _Body(),
      ),
      viewModelBuilder: () => SchedulesScreenViewModel(),
    );
  }
}

Widget _scheduleAppBar({SchedulesScreenViewModel model, String title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColor.primary,
    leading: BackButton(
      color: AppColor.appBg,
    ),
    centerTitle: true,
    title: Text(
      title,
      style:
          AppTextStyles.s5(color: AppColor.appBg, fontType: FontType.SEMI_BOLD),
    ),
    bottom: InlineCalender(
      controller: model.calendarController,
      locale: Locale('en_US'),
      isShamsi: false,
      height: 85.nsp,
      maxWeeks: 100,
      middleWeekday: DateTime.now().weekday,
    ),
  );
}

class _Body extends ViewModelWidget<SchedulesScreenViewModel> {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, SchedulesScreenViewModel model) {
    return ListView.builder(
      shrinkWrap: true,
      primary: true,
      physics: AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      padding: EdgeInsets.all(10.nsp),
      itemCount: tempSchedules.length,
      itemBuilder: (_, index) {
        Schedule schedule = tempSchedules[index];
        return _ScheduleCard(
          schedule: schedule,
        );
      },
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  final Schedule schedule;
  _ScheduleCard({@required this.schedule});
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  schedule?.title ?? "",
                  style: AppTextStyles.s3(fontType: FontType.MEDIUM),
                ),
              ),
              SizedBox(width: 25.nsp),
              InkWell(
                onTap: () {
                  showToast(msg: "Feature yet to be implemented");
                },
                child: Icon(
                  Icons.edit,
                  color: AppColor.primary,
                  size: 20.nsp,
                ),
              ),
              SizedBox(width: 25.nsp),
              InkWell(
                onTap: () {
                  showToast(msg: "Feature yet to be implemented");
                },
                child: Icon(
                  Icons.delete_outlined,
                  color: AppColor.appRed,
                  size: 20.nsp,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.nsp),
          Text(
            schedule?.message ?? "",
            style: AppTextStyles.s3(fontType: FontType.LIGHT),
          ),
          SizedBox(height: 10.nsp),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                schedule?.time ?? "",
                style: AppTextStyles.s2(fontType: FontType.LIGHT),
              ),
              SizedBox(width: 10.nsp),
              Text(
                schedule?.place ?? "",
                style: AppTextStyles.s2(fontType: FontType.LIGHT),
              ),
            ],
          )
        ],
      ),
    );
  }
}
