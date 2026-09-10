import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/responsive_extensions.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../core/widgets/responsive_container.dart';
import '../../../data/models/project_model.dart';
import '../../../l10n/app_localizations.dart';
import '../utils/project_localization.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ResponsiveContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TopBar(project: project, l10n: l10n),
                  const SizedBox(height: AppSpacing.xxl),
                  _ProjectHero(project: project, l10n: l10n),
                  const SizedBox(height: AppSpacing.xxxl),
                  _ProjectOverview(project: project, l10n: l10n),
                  if (project.screenshots.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.xxxl),
                    _ProjectScreenshots(project: project, l10n: l10n),
                  ],
                  const SizedBox(height: AppSpacing.xxxl),
                  _ProjectFeatures(project: project, l10n: l10n),
                  const SizedBox(height: AppSpacing.xxxl),
                  _ProjectTechStack(project: project, l10n: l10n),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashboardScreenshot extends StatelessWidget {
  final String imagePath;

  const _DashboardScreenshot({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Image.asset(
        imagePath,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.onSurface.withValues(alpha: 0.55),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileScreenshot extends StatelessWidget {
  final String imagePath;

  const _MobileScreenshot({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      color: context.colors.primary.withValues(alpha: 0.04),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;

  const _Pill({required this.label});

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
          fontWeight: FontWeight.w600,
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
    final isMobileProject = project.typeKey == 'projectTypeMobileApplication';

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.colors.primary.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(AppRadius.xLarge),
          border: Border.all(color: context.theme.dividerColor),
        ),
        clipBehavior: Clip.antiAlias,
        child: project.coverImage.isNotEmpty
            ? Image.asset(project.coverImage, fit: BoxFit.cover)
            : Center(
                child: Icon(
                  isMobileProject
                      ? Icons.phone_android_rounded
                      : Icons.dashboard_customize_outlined,
                  size: 72,
                  color: context.colors.primary,
                ),
              ),
      ),
    );
  }
}

class _ProjectFeatures extends StatelessWidget {
  final ProjectModel project;
  final AppLocalizations l10n;

  const _ProjectFeatures({required this.project, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return _SectionBlock(
      title: l10n.projectKeyFeatures,
      child: Wrap(
        spacing: AppSpacing.sm,
        runSpacing: AppSpacing.sm,
        children: project.featureKeys
            .map(
              (featureKey) =>
                  _Pill(label: ProjectLocalization.text(l10n, featureKey)),
            )
            .toList(),
      ),
    );
  }
}

class _ProjectHero extends StatelessWidget {
  final ProjectModel project;
  final AppLocalizations l10n;

  const _ProjectHero({required this.project, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final type = ProjectLocalization.text(l10n, project.typeKey);

    final title = ProjectLocalization.text(l10n, project.titleKey);

    final description = ProjectLocalization.text(
      l10n,
      project.fullDescriptionKey,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Text(
            title,
            style: context.textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: Text(
            description,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.onSurface.withValues(alpha: 0.72),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),
        _ProjectCover(project: project),
      ],
    );
  }
}

class _ProjectOverview extends StatelessWidget {
  final ProjectModel project;
  final AppLocalizations l10n;

  const _ProjectOverview({required this.project, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final role = ProjectLocalization.text(l10n, project.roleKey);

    final type = ProjectLocalization.text(l10n, project.typeKey);

    return _SectionBlock(
      title: l10n.projectOverview,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.large),
          border: Border.all(color: context.theme.dividerColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InfoRow(label: l10n.projectRole, value: role),
            _InfoRow(label: l10n.projectType, value: type),
            if (project.year.isNotEmpty)
              _InfoRow(label: l10n.projectYear, value: project.year),
          ],
        ),
      ),
    );
  }
}

class _ProjectScreenshots extends StatelessWidget {
  final ProjectModel project;
  final AppLocalizations l10n;

  const _ProjectScreenshots({required this.project, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final isMobileProject = project.typeKey == 'projectTypeMobileApplication';

    return _SectionBlock(
      title: l10n.projectScreenshots,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = context.isMobile || constraints.maxWidth < 800
              ? 1
              : 2;

          final itemWidth = columns == 1
              ? constraints.maxWidth
              : (constraints.maxWidth - AppSpacing.md) / 2;

          return Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: [
              for (final image in project.screenshots)
                SizedBox(
                  width: itemWidth,
                  child: _ScreenshotCard(
                    imagePath: image,
                    isMobileProject: isMobileProject,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ProjectTechStack extends StatelessWidget {
  final ProjectModel project;
  final AppLocalizations l10n;

  const _ProjectTechStack({required this.project, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return _SectionBlock(
      title: l10n.projectTechStack,
      child: Wrap(
        spacing: AppSpacing.sm,
        runSpacing: AppSpacing.sm,
        children: project.technologies
            .map((technology) => _Pill(label: technology))
            .toList(),
      ),
    );
  }
}

class _ScreenshotCard extends StatelessWidget {
  final String imagePath;
  final bool isMobileProject;

  const _ScreenshotCard({
    required this.imagePath,
    required this.isMobileProject,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surface,
      borderRadius: BorderRadius.circular(AppRadius.large),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          _openImage(context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.large),
            border: Border.all(color: context.theme.dividerColor),
          ),
          child: isMobileProject
              ? _MobileScreenshot(imagePath: imagePath)
              : _DashboardScreenshot(imagePath: imagePath),
        ),
      ),
    );
  }

  void _openImage(BuildContext context) {
    final colors = context.colors;

    showDialog<void>(
      context: context,
      barrierColor: colors.scrim.withValues(alpha: 0.85),
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: colors.surface.withValues(alpha: 0),
          insetPadding: const EdgeInsets.all(AppSpacing.lg),
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  minScale: 0.7,
                  maxScale: 5,
                  child: Image.asset(imagePath, fit: BoxFit.contain),
                ),
              ),
              PositionedDirectional(
                top: 0,
                end: 0,
                child: IconButton.filled(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  icon: const Icon(Icons.close_rounded),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionBlock extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionBlock({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        child,
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  final ProjectModel project;
  final AppLocalizations l10n;

  const _TopBar({required this.project, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Directionality.of(context) == TextDirection.rtl
                ? Icons.arrow_forward_rounded
                : Icons.arrow_back_rounded,
          ),
        ),
        const Spacer(),
        if (project.githubUrl.isNotEmpty)
          OutlinedButton.icon(
            onPressed: () {
              UrlLauncherHelper.launch(project.githubUrl);
            },
            icon: const Icon(Icons.code_rounded),
            label: Text(l10n.projectSourceCodeDetails),
          ),
      ],
    );
  }
}
