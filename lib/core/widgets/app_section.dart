import 'package:flutter/material.dart';

import '../extensions/responsive_extensions.dart';
import '../theme/app_spacing.dart';
import 'responsive_container.dart';

class AppSection extends StatelessWidget {
  final Key? sectionKey;
  final Widget child;

  const AppSection({super.key, this.sectionKey, required this.child});

  @override
  Widget build(BuildContext context) {
    final verticalPadding = context.isMobile
        ? AppSpacing.sectionSm
        : context.isTablet
        ? AppSpacing.sectionMd
        : AppSpacing.sectionLg;

    return Container(
      key: sectionKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: ResponsiveContainer(child: child),
    );
  }
}
