import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({Key? key, this.desktop, this.mobile}) : super(key: key);

  final Widget? mobile;
  final Widget? desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 576;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 992;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    if (size.width > 992 && desktop != null) {
      return desktop!;
    } else {
      return mobile!;
    }
  }
}
