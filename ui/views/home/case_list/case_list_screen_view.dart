import 'package:flutter/material.dart';
import 'package:inline_calender/inline_calender.dart';
import 'package:proficient_lawyer/cache.dart';
import 'package:proficient_lawyer/models/case.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/media/app_text_styles.dart';
import 'package:proficient_lawyer/ui/views/home/case_list/case_list_screen_view_model.dart.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaseListScreenView extends StatelessWidget {
  final DateTime selectedDate;

  CaseListScreenView({
    Key key,
    @required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CaseListScreenViewModel>.reactive(
      onModelReady: (model) => model.initState(),
      builder: (context, model, child) => Scaffold(
        appBar: _caseListAppBar(
          model: model,
          title: "My Cases",
        ),
        body: _Body(),
      ),
      viewModelBuilder: () =>
          CaseListScreenViewModel(selectedDate: selectedDate),
    );
  }
}

Widget _caseListAppBar({CaseListScreenViewModel model, String title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColor.primary,
    leading: BackButton(
      color: AppColor.appBg,
    ),
    centerTitle: true,
    title: Text(
      title,
      style:
          AppTextStyles.s5(color: AppColor.appBg, fontType: FontType.SEMI_BOLD),
    ),
    bottom: model.calendarController != null
        ? InlineCalender(
            controller: model.calendarController,
            locale: Locale('en_US'),
            isShamsi: false,
            height: 85.nsp,
            maxWeeks: 100,
            middleWeekday: model.selectedDate.weekday,
          )
        : SizedBox.shrink(),
  );
}

class _Body extends ViewModelWidget<CaseListScreenViewModel> {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, CaseListScreenViewModel model) {
    return ListView.builder(
      shrinkWrap: true,
      primary: true,
      physics: AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      padding: EdgeInsets.all(10.nsp),
      itemCount: 5,
      itemBuilder: (_, index) {
        Case caseDetail = Case();
        return _CaseCard(
          caseDetail: caseDetail,
          onSelect: (cd) => model.viewCaseDetail(index.toString()),
        );
      },
    );
  }
}

class _CaseCard extends StatelessWidget {
  final Case caseDetail;
  final Function(Case) onSelect;

  _CaseCard({
    @required this.caseDetail,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect?.call(caseDetail),
      child: Container(
        margin: EdgeInsets.only(bottom: 10.nsp),
        padding: EdgeInsets.symmetric(horizontal: 10.nsp, vertical: 15.nsp),
        decoration: BoxDecoration(
          color: AppColor.appBg,
          borderRadius: BorderRadius.circular(10.nsp),
          boxShadow: [
            BoxShadow(
              color: AppColor.appSilver.withOpacity(0.2),
              blurRadius: 2.nsp,
              offset: Offset(2.nsp, 4.nsp),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "21",
                    style: AppTextStyles.s5(
                        fontType: FontType.BOLD, color: AppColor.appBlue),
                  ),
                  SizedBox(height: 5.nsp),
                  Text(
                    "NOV",
                    style: AppTextStyles.s3(fontType: FontType.LIGHT),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CASE: ${"OS/2190/2387/23"}",
                    style: AppTextStyles.s3(fontType: FontType.MEDIUM),
                  ),
                  SizedBox(height: 10.nsp),
                  Text(
                    "Client: ${"Sharma Ji"}",
                    style: AppTextStyles.s2(fontType: FontType.LIGHT),
                  ),
                  SizedBox(height: 10.nsp),
                  Text(
                    "Adv: ${"John Samuel"}",
                    style: AppTextStyles.s2(fontType: FontType.LIGHT),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Hearing Pending",
                    style: AppTextStyles.s2(
                      fontType: FontType.MEDIUM,
                      color: AppColor.appRed,
                    ),
                  ),
                  SizedBox(height: 40.nsp),
                  Text(
                    "Next: ${"Discussion"}",
                    style: AppTextStyles.s2(fontType: FontType.LIGHT),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
