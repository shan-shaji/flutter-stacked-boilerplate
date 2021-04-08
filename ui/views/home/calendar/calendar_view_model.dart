import 'package:flutter/widgets.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:proficient_lawyer/app/locator.dart';
import 'package:proficient_lawyer/app/router.gr.dart';
import 'package:proficient_lawyer/app/utils/date_time_util.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  CalendarController calendarController = CalendarController();

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initializeDateFormatting();
    });
  }

  Map<DateTime, List<dynamic>> events = {};

  void onDaySelected(DateTime day, List events, List holidays) {
    _navigationService.navigateTo(Routes.caseListScreenView,
        arguments: CaseListScreenViewArguments(selectedDate: day));
  }

  void onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    fetchEvents(first, last);
  }

  void onCalendarCreated(DateTime first, DateTime last, CalendarFormat format) {
    fetchEvents(first, last);
  }

  Future<void> fetchEvents(DateTime first, DateTime last) async {
    await Future.delayed(Duration(milliseconds: 800));
    var response = getDummyEvents(first);
    if (response != null) {
      events = response;
      notifyListeners();
    }
  }

  Map<DateTime, List<dynamic>> getDummyEvents(DateTime first) {
    Map<DateTime, List<dynamic>> dummyEvents = {
      first.add(Duration(days: 2)): [],
      first.add(Duration(days: 12)): [],
      first.add(Duration(days: 15)): [],
      first.add(Duration(days: 21)): [],
      first.add(Duration(days: 27)): [],
    };
    return dummyEvents;
  }

  @override
  void dispose() {
    calendarController?.dispose();
    super.dispose();
  }
}
