import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String dateFormat = "dd MMM yyyy";

String getFormatedDate(DateTime day) {
  String date = DateFormat(dateFormat).format(day);
  return date;
}

DateTime toUtcFromFormatedDate(String date) {
  DateTime day = DateFormat(dateFormat).parse(date);
  return day.toUtc();
}

String getUtcStringDate(DateTime day) {
  String date = day.toUtc().toString();
  return date;
}

DateTime toUtcFromStringDate(String date) {
  DateTime day = DateTime.parse(date);
  return day.toUtc();
}

String getTime(TimeOfDay time) {
  final now = new DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
  final format = DateFormat.jm();
  return format.format(dt);
}

TimeOfDay toTime(String time) {
  final format = DateFormat.jm();
  return TimeOfDay.fromDateTime(format.parse(time));
}

Future<TimeOfDay> selectTime(BuildContext context) async {
  var time = await showTimePicker(
    initialTime: TimeOfDay.now(),
    initialEntryMode: TimePickerEntryMode.dial,
    context: context,
    builder: (BuildContext context, Widget child) {
      return child;
      // return MediaQuery(
      //   data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      //   child: child,
      // );
    },
  );
  return time;
}

Future<DateTime> selectDate(BuildContext context) async {
  var date = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1947),
    lastDate: DateTime(2047),
  );
  return date;
}
