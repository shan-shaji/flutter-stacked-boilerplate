import 'package:flutter/material.dart';
import 'package:proficient_lawyer/app/extensions/disable_focus_node_extenion.dart';
import 'package:proficient_lawyer/app/utils/date_time_util.dart';
import 'package:proficient_lawyer/app/utils/progress_indicator.dart';
import 'package:proficient_lawyer/models/proceeding.dart';
import 'package:proficient_lawyer/models/schedule.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/media/app_text_styles.dart';
import 'package:proficient_lawyer/ui/widgets/button/text_button.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProceedingDialog extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ProceedingDialog({Key key, this.request, this.completer})
      : super(key: key);

  @override
  _ProceedingDialogState createState() => _ProceedingDialogState(
      addProceeding: request.customData["addProceeding"]);
}

class _ProceedingDialogState extends State<ProceedingDialog> {
  final Future<bool> Function(Proceeding) addProceeding;

  _ProceedingDialogState({@required this.addProceeding});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _adjournedDateController =
      TextEditingController();
  Proceeding proceeding = Proceeding();
  bool busy = false;

  void setBusy(bool value) {
    setState(() {
      busy = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20.nsp),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CloseButton(
                  color: AppColor.appRed,
                  onPressed: () {
                    if (!busy) {
                      Navigator.pop(context);
                    }
                  }),
              Padding(
                padding: EdgeInsets.fromLTRB(20.nsp, 0, 20.nsp, 20.nsp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onTap: () => chooseDate(context),
                            focusNode: AlwaysDisabledFocusNode(),
                            controller: _dateController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: 'Date',
                              labelStyle: AppTextStyles.s3(),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Select a date';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        SizedBox(width: 30.nsp),
                        Expanded(
                          child: TextFormField(
                            onChanged: (text) => proceeding.advocate = text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: 'Advocate',
                              labelStyle: AppTextStyles.s3(),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Select a advocate';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.nsp),
                    TextFormField(
                      onChanged: (text) => proceeding.proceedings = text,
                      maxLines: 4,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        labelText: 'Proceedings',
                        labelStyle: AppTextStyles.s3(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Add a proceeding';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.nsp),
                    TextFormField(
                      onChanged: (text) => proceeding.remarks = text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        labelText: 'Remarks',
                        labelStyle: AppTextStyles.s3(),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.nsp),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onTap: () => chooseAdjournedDate(context),
                            focusNode: AlwaysDisabledFocusNode(),
                            controller: _adjournedDateController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: 'Adjourned To',
                              labelStyle: AppTextStyles.s3(),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Select adjourned date';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        SizedBox(width: 30.nsp),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: proceeding.priority,
                            items: ["high", "low"]
                                .map((label) => DropdownMenuItem(
                                      child: Text(label),
                                      value: label,
                                    ))
                                .toList(),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: 'Priority',
                              labelStyle: AppTextStyles.s3(),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Select Priority';
                              }
                              return null;
                            },
                            onChanged: (text) => proceeding.priority = text,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.nsp),
                    busy
                        ? customProgressIndicator()
                        : AppTextButton(
                            title: "Add Proceeding",
                            color: AppColor.primary,
                            style: AppTextStyles.s3(
                              fontType: FontType.BOLD,
                              color: AppColor.appBg,
                            ),
                            onTap: () => submitAction(),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitAction() async {
    if (!_formKey.currentState.validate()) return;
    setBusy(true);
    bool proceed = await addProceeding.call(proceeding);
    setBusy(false);

    if (proceed == true) {
      widget.completer.call(DialogResponse(confirmed: true));
    }
  }

  Future<void> chooseDate(BuildContext context) async {
    FocusScope.of(context).unfocus();
    var date = await selectDate(context);
    if (date != null) {
      setState(() {
        proceeding.date = getUtcStringDate(date);
        _dateController.text = getFormatedDate(date);
      });
    }
  }

  Future<void> chooseAdjournedDate(BuildContext context) async {
    FocusScope.of(context).unfocus();
    var date = await selectDate(context);
    if (date != null) {
      setState(() {
        proceeding.adjournedDate = getUtcStringDate(date);
        _adjournedDateController.text = getFormatedDate(date);
      });
    }
  }
}
