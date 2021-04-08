import 'package:proficient_lawyer/app/locator.dart';
import 'package:proficient_lawyer/ui/widgets/dialog/proceeding_dialog.dart';
import 'package:proficient_lawyer/ui/widgets/dialog/schedule_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

import 'base_dialog.dart';

enum DialogType { BASE, SCHEDULE, PROCEEDING }

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.BASE: (context, sheetRequest, completer) =>
        BaseDialog(request: sheetRequest, completer: completer),
    DialogType.SCHEDULE: (context, sheetRequest, completer) =>
        ScheduleDialog(request: sheetRequest, completer: completer),
    DialogType.PROCEEDING: (context, sheetRequest, completer) =>
        ProceedingDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
