import 'package:flutter/material.dart';

class Responsiveness extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsiveness({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 425;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024 &&
          MediaQuery.of(context).size.width > 425;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1024) {
      return desktop;
    }
    else if (_size.width > 425 && _size.width < 1024) {
      return tablet;
    }
    else {
      return mobile;
    }
  }
}
