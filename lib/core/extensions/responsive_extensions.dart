import 'package:flutter/material.dart';

import '../constants/app_breakpoints.dart';

extension ResponsiveExtensions on BuildContext {
  bool get isDesktop =>
      screenWidth >= AppBreakpoints.tablet &&
      screenWidth < AppBreakpoints.desktop;

  bool get isLargeDesktop => screenWidth >= AppBreakpoints.desktop;

  bool get isMobile => screenWidth < AppBreakpoints.mobile;

  bool get isTablet =>
      screenWidth >= AppBreakpoints.mobile &&
      screenWidth < AppBreakpoints.tablet;

  double get screenWidth => MediaQuery.sizeOf(this).width;
}
