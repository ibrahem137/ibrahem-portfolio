import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/responsive_container.dart';
import '../../../l10n/app_localizations.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: context.theme.dividerColor)),
      ),
      child: ResponsiveContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 600;

              final logo = Text(
                'IA.',
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w800,
                ),
              );

              final footerText = Text(
                l10n.footerText,
                textAlign: isMobile ? TextAlign.center : TextAlign.end,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.onSurface.withValues(alpha: 0.55),
                ),
              );

              if (isMobile) {
                return Column(
                  children: [
                    logo,
                    const SizedBox(height: AppSpacing.sm),
                    footerText,
                  ],
                );
              }

              return Row(
                children: [
                  logo,
                  const Spacer(),
                  Flexible(child: footerText),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
