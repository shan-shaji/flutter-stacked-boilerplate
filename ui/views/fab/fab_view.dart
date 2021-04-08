import 'package:flutter/material.dart';
import 'package:proficient_lawyer/app/utils/toast_util.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/views/fab/fab_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home/case_list/add_case/add_case_screen_view.dart';

class FabView extends StatelessWidget {
  const FabView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FabViewModel>.reactive(
      builder: (context, model, child) => UnicornDialer(
        backgroundColor: Colors.transparent,
        parentButtonBackground: AppColor.appRed,
        orientation: UnicornOrientation.VERTICAL,
        childPadding: 0,
        animationDuration: 200,
        hasNotch: true,
        hasBackground: false,
        parentButton: Icon(
          Icons.add,
          size: 50.nsp,
        ),
        finalButtonIcon: Icon(
          Icons.close,
          size: 50.nsp,
        ),
        childButtons: <UnicornButton>[
          _fabButton(
            tag: "Add Case",
            icon: Icons.add,
            mini: true,
            color: AppColor.appGreen,
            onTap: () => model.addACase(),
          ),
          _fabButton(
            tag: "Add Schedule",
            icon: Icons.schedule_sharp,
            color: AppColor.appOrange,
            onTap: () => model.showAddScheduleDialog(),
          ),
        ],
      ),
      viewModelBuilder: () => FabViewModel(),
    );
  }

  UnicornButton _fabButton({
    @required String tag,
    @required IconData icon,
    Color color,
    bool mini,
    VoidCallback onTap,
  }) =>
      UnicornButton(
        hasLabel: true,
        labelText: tag,
        labelColor: AppColor.appBg,
        labelBackgroundColor: color ?? AppColor.primary,
        currentButton: FloatingActionButton(
          // isExtended: true,
          // tooltip: tag,
          heroTag: tag,
          backgroundColor: color ?? AppColor.primary,
          mini: mini ?? true,
          child: Icon(
            icon,
            size: 40.nsp,
            color: AppColor.appBg,
          ),
          onPressed: () => onTap?.call(),
        ),
      );
}
