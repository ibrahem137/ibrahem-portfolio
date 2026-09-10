import 'package:flutter/material.dart';

import '../../../core/constants/app_links.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../core/widgets/app_section.dart';
import '../../../core/widgets/responsive_container.dart';
import '../../../l10n/app_localizations.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppSection(
      child: ResponsiveContainer(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xxl),
          decoration: BoxDecoration(
            color: context.colors.primary.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(AppRadius.xLarge),
            border: Border.all(
              color: context.colors.primary.withValues(alpha: 0.15),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isCompact = constraints.maxWidth < 850;
              final isMobile = constraints.maxWidth < 600;

              final content = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.contactEyebrow,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.4,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Text(
                      l10n.contactTitle,
                      style: context.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Text(
                      l10n.contactDescription,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.colors.onSurface.withValues(alpha: 0.70),
                      ),
                    ),
                  ),
                ],
              );

              final contactButtons = <Widget>[
                _ContactButton(
                  label: l10n.contactEmail,
                  icon: Icons.email_outlined,
                  url: AppLinks.email,
                  primary: true,
                ),
                _ContactButton(
                  label: l10n.contactWhatsapp,
                  icon: Icons.chat_outlined,
                  url: AppLinks.whatsapp,
                ),
                _ContactButton(
                  label: l10n.contactGithub,
                  icon: Icons.code_rounded,
                  url: AppLinks.github,
                ),
                _ContactButton(
                  label: l10n.contactLinkedin,
                  icon: Icons.business_center_outlined,
                  url: AppLinks.linkedin,
                ),
                _ContactButton(
                  label: l10n.contactInstagram,
                  icon: Icons.camera_alt_outlined,
                  url: AppLinks.instagram,
                ),
              ];

              final Widget actions;

              if (isMobile) {
                actions = Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = 0; i < contactButtons.length; i++) ...[
                      contactButtons[i],
                      if (i != contactButtons.length - 1)
                        const SizedBox(height: AppSpacing.sm),
                    ],
                  ],
                );
              } else {
                actions = Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: contactButtons,
                );
              }

              if (isCompact) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    content,
                    const SizedBox(height: AppSpacing.xxl),
                    SizedBox(width: double.infinity, child: actions),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 3, child: content),
                  const SizedBox(width: AppSpacing.xxl),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: actions,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String url;
  final bool primary;

  const _ContactButton({
    required this.label,
    required this.icon,
    required this.url,
    this.primary = false,
  });

  @override
  Widget build(BuildContext context) {
    if (primary) {
      return FilledButton.icon(
        onPressed: () {
          UrlLauncherHelper.launch(url);
        },
        icon: Icon(icon),
        label: Text(label),
      );
    }

    return OutlinedButton.icon(
      onPressed: () {
        UrlLauncherHelper.launch(url);
      },
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
