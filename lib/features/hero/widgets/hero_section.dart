import 'package:flutter/material.dart';

import '../../../core/constants/app_links.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/responsive_extensions.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../core/widgets/responsive_container.dart';
import '../../../core/widgets/staggered_reveal.dart';
import '../../../l10n/app_localizations.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWorkPressed;

  const HeroSection({
    super.key,
    required this.onViewWorkPressed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isRtl =
        Directionality.of(context) == TextDirection.rtl;

    return ResponsiveContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.isMobile ? 56 : 88,
        ),
        child: context.isDesktop
            ? Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: _HeroContent(
                      l10n: l10n,
                      onViewWorkPressed: onViewWorkPressed,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xxxl),
                  Expanded(
                    flex: 4,
                    child: StaggeredReveal(
                      delay: const Duration(
                        milliseconds: 180,
                      ),
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      offsetX: isRtl ? -18 : 18,
                      offsetY: 0,
                      child: const _HeroImage(),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  StaggeredReveal(
                    delay: const Duration(
                      milliseconds: 120,
                    ),
                    duration: const Duration(
                      milliseconds: 700,
                    ),
                    offsetY: 18,
                    child: const _HeroImage(),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  _HeroContent(
                    l10n: l10n,
                    onViewWorkPressed: onViewWorkPressed,
                  ),
                ],
              ),
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  final AppLocalizations l10n;
  final VoidCallback onViewWorkPressed;

  const _HeroContent({
    required this.l10n,
    required this.onViewWorkPressed,
  });

  @override
  Widget build(BuildContext context) {
    final centered = !context.isDesktop;

    return Column(
      crossAxisAlignment: centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        StaggeredReveal(
          delay: const Duration(milliseconds: 50),
          child: Text(
            l10n.heroGreeting,
            textAlign: centered
                ? TextAlign.center
                : TextAlign.start,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        StaggeredReveal(
          delay: const Duration(milliseconds: 120),
          child: Text(
            l10n.heroName,
            textAlign: centered
                ? TextAlign.center
                : TextAlign.start,
            style: context.textTheme.displayMedium
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        StaggeredReveal(
          delay: const Duration(milliseconds: 190),
          child: Text(
            l10n.heroRole,
            textAlign: centered
                ? TextAlign.center
                : TextAlign.start,
            style: context.textTheme.headlineMedium
                ?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        StaggeredReveal(
          delay: const Duration(milliseconds: 260),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: Text(
              l10n.heroDescription,
              textAlign: centered
                  ? TextAlign.center
                  : TextAlign.start,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.onSurface.withValues(
                  alpha: 0.72,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        StaggeredReveal(
          delay: const Duration(milliseconds: 330),
          child: Wrap(
            alignment: centered
                ? WrapAlignment.center
                : WrapAlignment.start,
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              FilledButton.icon(
                onPressed: onViewWorkPressed,
                icon: const Icon(
                  Icons.arrow_downward_rounded,
                ),
                label: Text(l10n.viewMyWork),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  UrlLauncherHelper.launch(AppLinks.cv);
                },
                icon: const Icon(Icons.download_rounded),
                label: Text(l10n.downloadCv),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        StaggeredReveal(
          delay: const Duration(milliseconds: 400),
          child: Wrap(
            alignment: centered
                ? WrapAlignment.center
                : WrapAlignment.start,
            spacing: AppSpacing.sm,
            children: const [
              _SocialButton(
                icon: Icons.code_rounded,
                tooltip: 'GitHub',
                url: AppLinks.github,
              ),
              _SocialButton(
                icon: Icons.business_center_rounded,
                tooltip: 'LinkedIn',
                url: AppLinks.linkedin,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeroImage extends StatelessWidget {
  const _HeroImage();

  @override
  Widget build(BuildContext context) {
    final imageSize = context.isMobile ? 280.0 : 380.0;

    return Center(
      child: SizedBox(
        width: imageSize,
        height: imageSize,
        child: Stack(
          children: [
            Positioned(
              top: 18,
              right: 0,
              bottom: 0,
              left: 18,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.primary.withValues(
                    alpha: 0.14,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppRadius.xLarge,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 18,
              bottom: 18,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppRadius.xLarge,
                  ),
                  border: Border.all(
                    color: context.colors.primary
                        .withValues(alpha: 0.35),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppRadius.xLarge - 1,
                  ),
                  child: Image.asset(
                    'assets/images/profile/ibrahem_profile.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final String url;

  const _SocialButton({
    required this.icon,
    required this.tooltip,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        UrlLauncherHelper.launch(url);
      },
      tooltip: tooltip,
      icon: Icon(icon, size: 20),
      style: IconButton.styleFrom(
        minimumSize: const Size(46, 46),
        side: BorderSide(color: context.theme.dividerColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.medium,
          ),
        ),
      ),
    );
  }
}
