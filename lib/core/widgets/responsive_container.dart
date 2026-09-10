import 'package:flutter/material.dart';

import '../constants/app_breakpoints.dart';
import '../extensions/responsive_extensions.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const ResponsiveContainer({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppBreakpoints.maxContentWidth,
        ),
        child: Padding(
          padding: padding ?? _defaultPadding(context),
          child: child,
        ),
      ),
    );
  }

  EdgeInsetsGeometry _defaultPadding(BuildContext context) {
    if (context.isMobile) {
      return const EdgeInsets.symmetric(horizontal: 20);
    }

    if (context.isTablet) {
      return const EdgeInsets.symmetric(horizontal: 32);
    }

    return const EdgeInsets.symmetric(horizontal: 48);
  }
}
