import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class BaseDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const BaseDialog({Key key, this.request, this.completer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(),
    );
  }
}
