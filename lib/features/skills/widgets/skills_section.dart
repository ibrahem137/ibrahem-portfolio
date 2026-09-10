import 'package:flutter/material.dart';
import 'package:ibrahem_portfolio/core/widgets/hover_card.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_section.dart';
import '../../../data/models/skill_model.dart';
import '../../../data/portfolio_data/skills_data.dart';
import '../../../l10n/app_localizations.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SkillsHeader(l10n: l10n),
          const SizedBox(height: AppSpacing.xxl),
          _SkillsGrid(l10n: l10n),
        ],
      ),
    );
  }
}

class _NaturalSkillCard extends StatelessWidget {
  final SkillModel skill;
  final String title;

  const _NaturalSkillCard({required this.skill, required this.title});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      borderRadius: BorderRadius.circular(AppRadius.large),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.large),
          border: Border.all(color: context.theme.dividerColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(AppRadius.medium),
              ),
              child: Icon(skill.icon, color: context.colors.primary, size: 23),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: skill.skills
                  .map((item) => _SkillChip(label: item))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final SkillModel skill;
  final String title;

  const _SkillCard({required this.skill, required this.title});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      borderRadius: BorderRadius.circular(AppRadius.large),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.large),
          border: Border.all(color: context.theme.dividerColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(AppRadius.medium),
              ),
              child: Icon(skill.icon, color: context.colors.primary, size: 23),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: skill.skills
                  .map((item) => _SkillChip(label: item))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.colors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: context.textTheme.bodySmall?.copyWith(
          color: context.colors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  final AppLocalizations l10n;

  const _SkillsGrid({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Mobile
        if (width < 700) {
          return Column(
            children: [
              for (var i = 0; i < SkillsData.skills.length; i++) ...[
                _NaturalSkillCard(
                  skill: SkillsData.skills[i],
                  title: _localizedTitle(SkillsData.skills[i].title),
                ),
                if (i != SkillsData.skills.length - 1)
                  const SizedBox(height: AppSpacing.md),
              ],
            ],
          );
        }

        final columns = width < 1100 ? 2 : 3;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: SkillsData.skills.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,

            // Equal height for all skill cards.
            mainAxisExtent: 380,
          ),
          itemBuilder: (context, index) {
            final skill = SkillsData.skills[index];

            return _SkillCard(
              skill: skill,
              title: _localizedTitle(skill.title),
            );
          },
        );
      },
    );
  }

  String _localizedTitle(String title) {
    switch (title) {
      case 'Mobile & Web':
        return l10n.skillsMobileWeb;

      case 'Architecture':
        return l10n.skillsArchitecture;

      case 'State Management':
        return l10n.skillsStateManagement;

      case 'API & Networking':
        return l10n.skillsApiNetworking;

      case 'Data & Services':
        return l10n.skillsDataServices;

      case 'Tools':
        return l10n.skillsTools;

      default:
        return title;
    }
  }
}

class _SkillsHeader extends StatelessWidget {
  final AppLocalizations l10n;

  const _SkillsHeader({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 720),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.skillsEyebrow,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.skillsTitle,
            style: context.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.skillsDescription,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.onSurface.withValues(alpha: 0.72),
            ),
          ),
        ],
      ),
    );
  }
}
