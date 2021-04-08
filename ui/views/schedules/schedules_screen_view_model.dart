import 'package:inline_calender/inline_calender.dart';
import 'package:stacked/stacked.dart';

class SchedulesScreenViewModel extends BaseViewModel {
  InlineCalenderModel calendarController;
  DateTime pickedDate = DateTime.now();

  void initState() {
    calendarController = InlineCalenderModel(
      defaultSelectedDate: pickedDate,
      onChange: (DateTime date) => print(date),
    );
  }

  @override
  void dispose() {
    print('dispose');
    calendarController.dispose();
    super.dispose();
  }
}
