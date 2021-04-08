import 'package:proficient_lawyer/app/locator.dart';
import 'package:proficient_lawyer/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DrawerViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void goToPage(String route) {
    _navigationService.back();
    _navigationService.navigateTo(route);
  }

  void onCaseSelected() {
    _navigationService.navigateTo(Routes.caseListScreenView,
        arguments: CaseListScreenViewArguments(selectedDate: DateTime.now()));
  }
}
