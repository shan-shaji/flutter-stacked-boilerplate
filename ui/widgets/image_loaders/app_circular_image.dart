import 'package:flutter/material.dart';

class AppCircularImage extends StatelessWidget {
  final Widget child;
  final double radius;

  const AppCircularImage({
    Key key,
    @required this.child,
    @required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 2 * radius,
        width: 2 * radius,
        child: ClipOval(child: child),
      ),
    );
  }
}
