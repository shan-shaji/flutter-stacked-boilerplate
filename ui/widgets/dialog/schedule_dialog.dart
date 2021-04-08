import 'package:flutter/material.dart';
import 'package:proficient_lawyer/app/extensions/disable_focus_node_extenion.dart';
import 'package:proficient_lawyer/app/utils/date_time_util.dart';
import 'package:proficient_lawyer/app/utils/progress_indicator.dart';
import 'package:proficient_lawyer/models/schedule.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/media/app_text_styles.dart';
import 'package:proficient_lawyer/ui/widgets/button/text_button.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleDialog extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ScheduleDialog({Key key, this.request, this.completer})
      : super(key: key);

  @override
  _ScheduleDialogState createState() =>
      _ScheduleDialogState(addSchedule: request.customData["addSchedule"]);
}

class _ScheduleDialogState extends State<ScheduleDialog> {
  final Future<bool> Function(Schedule) addSchedule;

  _ScheduleDialogState({@required this.addSchedule});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  Schedule schedule = Schedule();
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
                    TextFormField(
                      onChanged: (text) => schedule.title = text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        labelText: 'Title',
                        labelStyle: AppTextStyles.s3(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Add a valid title';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.nsp),
                    TextFormField(
                      onChanged: (text) => schedule.message = text,
                      maxLines: 2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        labelText: 'Message',
                        labelStyle: AppTextStyles.s3(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Add a valid message';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.nsp),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (text) => schedule.label = text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: 'Label',
                              labelStyle: AppTextStyles.s3(),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(width: 30.nsp),
                        Expanded(
                          child: TextFormField(
                            onChanged: (text) => schedule.place = text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: 'Place',
                              labelStyle: AppTextStyles.s3(),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.nsp),
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
                            onTap: () => chooseTime(context),
                            focusNode: AlwaysDisabledFocusNode(),
                            controller: _timeController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: 'Time',
                              labelStyle: AppTextStyles.s3(),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Select a time';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.nsp),
                    busy
                        ? customProgressIndicator()
                        : AppTextButton(
                            title: "Add Schedule",
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
    bool proceed = await addSchedule.call(schedule);
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
        schedule.date = getUtcStringDate(date);
        _dateController.text = getFormatedDate(date);
      });
    }
  }

  void chooseTime(BuildContext context) async {
    FocusScope.of(context).unfocus();
    var time = await selectTime(context);
    if (time != null) {
      setState(() {
        schedule.time = getTime(time);
        _timeController.text = getTime(time);
      });
    }
  }
}
