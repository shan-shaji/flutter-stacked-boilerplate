import 'package:flutter/material.dart';
import 'package:proficient_lawyer/app/locator.dart';
import 'package:proficient_lawyer/app/utils/toast_util.dart';
import 'package:proficient_lawyer/models/proceeding.dart';
import 'package:proficient_lawyer/ui/widgets/dialog/setup_dialog_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CaseDetailsScreenViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final String caseId;

  TabController tabController;

  CaseDetailsScreenViewModel(this.caseId, {TickerProvider vsync}) {
    tabController = TabController(length: 3, vsync: vsync);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  void updateTabIndex(int value) {
    tabController.index = value;
    notifyListeners();
  }

  Future<void> showAddProceedingDialog() async {
    var response = await _dialogService.showCustomDialog(
      barrierDismissible: false,
      variant: DialogType.PROCEEDING,
      customData: {"addProceeding": addProceeding},
    );
    if (response?.confirmed == true)
      showToast(msg: "Proceeding added successfully");
    else
      showToast(msg: "Cancelled");
  }

  Future<bool> addProceeding(Proceeding proceeding) async {
    await Future.delayed(Duration(seconds: 4));
    return true;
  }
}
