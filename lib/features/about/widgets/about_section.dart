import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/responsive_extensions.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_section.dart';
import '../../../l10n/app_localizations.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppSection(
      child: context.isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _AboutContent(l10n: l10n)),
                const SizedBox(width: AppSpacing.xxxl),
                Expanded(flex: 4, child: _QuickFacts(l10n: l10n)),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _AboutContent(l10n: l10n),
                const SizedBox(height: AppSpacing.xxl),
                _QuickFacts(l10n: l10n),
              ],
            ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  final AppLocalizations l10n;

  const _AboutContent({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.aboutEyebrow,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          l10n.aboutTitle,
          style: context.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          l10n.aboutDescription,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colors.onSurface.withValues(alpha: 0.72),
          ),
        ),
      ],
    );
  }
}

class _FactCard extends StatelessWidget {
  final _FactData data;

  const _FactCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.large),
        border: Border.all(color: context.theme.dividerColor),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: context.colors.primary.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(AppRadius.medium),
            ),
            child: Icon(data.icon, color: context.colors.primary, size: 22),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.label,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colors.onSurface.withValues(alpha: 0.60),
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  data.value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FactData {
  final IconData icon;
  final String label;
  final String value;

  const _FactData({
    required this.icon,
    required this.label,
    required this.value,
  });
}

class _QuickFacts extends StatelessWidget {
  final AppLocalizations l10n;

  const _QuickFacts({required this.l10n});

  @override
  Widget build(BuildContext context) {
    final facts = [
      _FactData(
        icon: Icons.location_on_outlined,
        label: l10n.aboutLocationLabel,
        value: l10n.aboutLocationValue,
      ),
      _FactData(
        icon: Icons.school_outlined,
        label: l10n.aboutStudyLabel,
        value: l10n.aboutStudyValue,
      ),
      _FactData(
        icon: Icons.code_rounded,
        label: l10n.aboutRoleLabel,
        value: l10n.aboutRoleValue,
      ),
      _FactData(
        icon: Icons.devices_rounded,
        label: l10n.aboutFocusLabel,
        value: l10n.aboutFocusValue,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final useGrid = constraints.maxWidth >= 500;

        if (!useGrid) {
          return Column(
            children: [
              for (var i = 0; i < facts.length; i++) ...[
                _FactCard(data: facts[i]),
                if (i != facts.length - 1)
                  const SizedBox(height: AppSpacing.sm),
              ],
            ],
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: facts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
            childAspectRatio: 2.15,
          ),
          itemBuilder: (context, index) {
            return _FactCard(data: facts[index]);
          },
        );
      },
    );
  }
}
