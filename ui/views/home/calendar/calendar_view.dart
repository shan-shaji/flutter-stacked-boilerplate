import 'package:flutter/material.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/media/app_text_styles.dart';
import 'package:proficient_lawyer/ui/views/home/calendar/calendar_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalendarViewModel>.reactive(
      onModelReady: (model) => model.initState(),
      builder: (context, model, child) => _Body(),
      viewModelBuilder: () => CalendarViewModel(),
    );
  }
}

class _Body extends ViewModelWidget<CalendarViewModel> {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, CalendarViewModel model) {
    return Container(
      margin: EdgeInsets.all(10.nsp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.nsp),
          color: AppColor.appBg,
          border: Border.all(
            width: 0.1.nsp,
            color: AppColor.appSilver.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.appSilver.withOpacity(0.5),
              offset: Offset(0, 5.nsp),
              spreadRadius: 5.nsp,
              blurRadius: 5.nsp,
            ),
          ]),
      child: TableCalendar(
        rowHeight: 55.nsp,
        calendarController: model.calendarController,
        availableGestures: AvailableGestures.none,
        events: model.events,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        calendarStyle: CalendarStyle(
          markersColor: AppColor.appRed,
          outsideDaysVisible: true,
          selectedColor: AppColor.appBlue,
          selectedStyle: AppTextStyles.s3(color: AppColor.appBg),
          eventDayStyle: AppTextStyles.s3(color: AppColor.appBg),
          weekdayStyle: AppTextStyles.s2(),
          holidayStyle: AppTextStyles.s2(),
          weekendStyle: AppTextStyles.s2(color: AppColor.appRed),
          outsideStyle:
              AppTextStyles.s2(color: AppColor.appBlack.withOpacity(0.5)),
          outsideWeekendStyle:
              AppTextStyles.s2(color: AppColor.appRed.withOpacity(0.5)),
          todayColor: AppColor.appGreen,
          todayStyle: AppTextStyles.s3(color: AppColor.appBg),
        ),
        headerStyle: HeaderStyle(
          centerHeaderTitle: true,
          formatButtonVisible: false,
          titleTextStyle: AppTextStyles.s4(
            color: AppColor.appBg,
            fontType: FontType.SEMI_BOLD,
          ),
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: AppColor.appBg,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: AppColor.appBg,
          ),
          headerPadding: EdgeInsets.all(20.nsp),
          headerMargin: EdgeInsets.only(bottom: 15.nsp),
          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.nsp),
            ),
          ),
        ),
        onDaySelected: model.onDaySelected,
        onVisibleDaysChanged: model.onVisibleDaysChanged,
        onCalendarCreated: model.onCalendarCreated,
        builders: CalendarBuilders(
          markersBuilder: (context, date, events, holidays) {
            final children = <Widget>[];

            if (events != null) {
              children.add(
                Positioned(
                  child: _EventMarker(date: date),
                ),
              );
            }
            return children;
          },
        ),
      ),
    );
  }
}

class _EventMarker extends StatelessWidget {
  final DateTime date;
  const _EventMarker({Key key, @required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30.nsp),
        ),
        alignment: Alignment.center,
        margin: const EdgeInsets.all(4.0),
        width: 35.nsp,
        height: 35.nsp,
        child: Text(
          '${date.day}',
          style: AppTextStyles.s3(color: AppColor.appBg),
        ),
      ),
    );
  }
}
