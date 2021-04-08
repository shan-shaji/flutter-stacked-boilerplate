import 'package:proficient_lawyer/app/locator.dart';
import 'package:proficient_lawyer/app/utils/toast_util.dart';
import 'package:proficient_lawyer/models/schedule.dart';
import 'package:proficient_lawyer/ui/widgets/dialog/setup_dialog_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:proficient_lawyer/app/router.gr.dart';

class FabViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> showAddScheduleDialog() async {
    var response = await _dialogService.showCustomDialog(
      barrierDismissible: false,
      variant: DialogType.SCHEDULE,
      customData: {"addSchedule": addSchedule},
    );
    if (response?.confirmed == true)
      showToast(msg: "Schedule added successfully");
    else
      showToast(msg: "Cancelled");
  }

  Future<bool> addSchedule(Schedule schedule) async {
    await Future.delayed(Duration(seconds: 4));
    return true;
  }

  void addACase() {
    _navigationService.navigateTo(Routes.addCaseScreenView);
  }
}
