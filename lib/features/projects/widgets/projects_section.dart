import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/routing/app_router.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../core/widgets/app_section.dart';
import '../../../core/widgets/hover_card.dart';
import '../../../data/models/project_model.dart';
import '../../../data/portfolio_data/projects_data.dart';
import '../../../l10n/app_localizations.dart';
import '../utils/project_localization.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProjectsHeader(l10n: l10n),
          const SizedBox(height: AppSpacing.xxl),
          _ProjectsGrid(l10n: l10n),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final AppLocalizations l10n;
  final bool useEqualHeight;

  const _ProjectCard({
    required this.project,
    required this.l10n,
    required this.useEqualHeight,
  });

  @override
  Widget build(BuildContext context) {
    final body = Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ProjectLocalization.text(l10n, project.typeKey),
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (project.featured)
                Icon(
                  Icons.star_rounded,
                  size: 20,
                  color: context.colors.primary,
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            ProjectLocalization.text(l10n, project.titleKey),
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            ProjectLocalization.text(l10n, project.shortDescriptionKey),
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface.withValues(alpha: 0.68),
            ),
          ),
          if (useEqualHeight)
            const Spacer()
          else
            const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: project.technologies
                .take(5)
                .map((technology) => _TechnologyChip(label: technology))
                .toList(),
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRouter.projectRoute(project.slug));
                },
                child: Text(l10n.projectViewDetails),
              ),
              if (project.githubUrl.isNotEmpty)
                IconButton(
                  onPressed: () {
                    UrlLauncherHelper.launch(project.githubUrl);
                  },
                  tooltip: l10n.projectSourceCode,
                  icon: const Icon(Icons.code_rounded),
                ),
            ],
          ),
        ],
      ),
    );

    return HoverCard(
      borderRadius: BorderRadius.circular(AppRadius.large),
      child: Container(
        width: double.infinity,
        height: useEqualHeight ? double.infinity : null,
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.large),
          border: Border.all(color: context.theme.dividerColor),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProjectCover(project: project),
            if (useEqualHeight) Expanded(child: body) else body,
          ],
        ),
      ),
    );
  }
}

class _ProjectCover extends StatelessWidget {
  final ProjectModel project;

  const _ProjectCover({required this.project});

  @override
  Widget build(BuildContext context) {
    if (project.coverImage.isNotEmpty) {
      return AspectRatio(
        aspectRatio: 16 / 10,
        child: Image.asset(
          project.coverImage,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }

    final isMobileProject = project.typeKey == 'projectTypeMobileApplication';

    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Container(
        color: context.colors.primary.withValues(alpha: 0.07),
        child: Center(
          child: Icon(
            isMobileProject
                ? Icons.phone_android_rounded
                : Icons.dashboard_customize_outlined,
            size: 54,
            color: context.colors.primary,
          ),
        ),
      ),
    );
  }
}

class _ProjectsGrid extends StatelessWidget {
  final AppLocalizations l10n;

  const _ProjectsGrid({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width < 700) {
          return Column(
            children: [
              for (var i = 0; i < ProjectsData.projects.length; i++) ...[
                _ProjectCard(
                  project: ProjectsData.projects[i],
                  l10n: l10n,
                  useEqualHeight: false,
                ),
                if (i != ProjectsData.projects.length - 1)
                  const SizedBox(height: AppSpacing.md),
              ],
            ],
          );
        }

        final columns = width < 1100 ? 2 : 3;

        final isArabic = Localizations.localeOf(context).languageCode == 'ar';

        final double cardHeight;

        if (columns == 2) {
          cardHeight = isArabic ? 740.0 : 700.0;
        } else {
          cardHeight = isArabic ? 720.0 : 680.0;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: ProjectsData.projects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
            mainAxisExtent: cardHeight,
          ),
          itemBuilder: (context, index) {
            return _ProjectCard(
              project: ProjectsData.projects[index],
              l10n: l10n,
              useEqualHeight: true,
            );
          },
        );
      },
    );
  }
}

class _ProjectsHeader extends StatelessWidget {
  final AppLocalizations l10n;

  const _ProjectsHeader({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 720),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.projectsEyebrow,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.projectsTitle,
            style: context.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.projectsDescription,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.onSurface.withValues(alpha: 0.72),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechnologyChip extends StatelessWidget {
  final String label;

  const _TechnologyChip({required this.label});

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
