import 'package:flutter/material.dart';
import 'package:proficient_lawyer/app/locator.dart';
import 'package:proficient_lawyer/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void openDrawer(BuildContext context) => Scaffold.of(context).openDrawer();

  void gotoScheduleList() {
    _navigationService.navigateTo(Routes.scheduleScreenView);
  }
}
