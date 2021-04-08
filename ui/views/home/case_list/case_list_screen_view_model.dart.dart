import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:inline_calender/inline_calender.dart';
import 'package:proficient_lawyer/app/locator.dart';
import 'package:proficient_lawyer/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CaseListScreenViewModel extends BaseViewModel {
  final DateTime selectedDate;

  CaseListScreenViewModel({@required this.selectedDate});

  final NavigationService _navigationService = locator<NavigationService>();
  InlineCalenderModel calendarController;

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    calendarController = InlineCalenderModel(
      defaultSelectedDate: selectedDate,
      onChange: (DateTime date) => print(date),
    );
  }

  void viewCaseDetail(String id) {
    _navigationService.navigateTo(Routes.caseDetailsScreenView,
        arguments: CaseDetailsScreenViewArguments(caseId: id));
  }

  @override
  void dispose() {
    print('dispose');
    calendarController.dispose();
    super.dispose();
  }
}
