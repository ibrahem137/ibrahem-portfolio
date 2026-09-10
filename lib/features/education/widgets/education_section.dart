import 'package:flutter/material.dart';
import 'package:ibrahem_portfolio/core/widgets/hover_card.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_section.dart';
import '../../../core/widgets/responsive_container.dart';
import '../../../l10n/app_localizations.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppSection(
      child: ResponsiveContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.educationEyebrow,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.4,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              l10n.educationTitle,
              style: context.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
                l10n.educationDescription,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.onSurface.withValues(alpha: 0.68),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            _EducationCard(l10n: l10n),
          ],
        ),
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  final AppLocalizations l10n;

  const _EducationCard({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      borderRadius: BorderRadius.circular(AppRadius.large),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.xLarge),
          border: Border.all(color: context.theme.dividerColor),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 700;

            final universityInfo = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: context.colors.primary.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(AppRadius.large),
                  ),
                  child: Icon(
                    Icons.school_rounded,
                    color: context.colors.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  l10n.educationUniversity,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  l10n.educationFaculty,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colors.onSurface.withValues(alpha: 0.72),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                _EducationTag(label: l10n.educationMajor),
              ],
            );

            final details = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _EducationDetail(
                  icon: Icons.person_outline_rounded,
                  label: l10n.educationStatus,
                ),
                const SizedBox(height: AppSpacing.md),
                _EducationDetail(
                  icon: Icons.event_available_rounded,
                  label:
                      '${l10n.educationExpectedGraduation}: '
                      '${l10n.educationExpectedGraduationValue}',
                ),
              ],
            );

            if (isCompact) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  universityInfo,
                  const SizedBox(height: AppSpacing.xxl),
                  details,
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: universityInfo),
                const SizedBox(width: AppSpacing.xxl),
                Expanded(flex: 2, child: details),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _EducationDetail extends StatelessWidget {
  final IconData icon;
  final String label;

  const _EducationDetail({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 22, color: context.colors.primary),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            label,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _EducationTag extends StatelessWidget {
  final String label;

  const _EducationTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: context.colors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colors.primary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
