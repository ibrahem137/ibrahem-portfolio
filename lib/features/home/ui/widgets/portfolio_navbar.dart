import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../logic/locale/locale_cubit.dart';
import '../../../../logic/theme/theme_cubit.dart';

class PortfolioNavbar extends StatelessWidget {
  final VoidCallback onAboutPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onExperiencePressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onEducationPressed;
  final VoidCallback onContactPressed;

  const PortfolioNavbar({
    super.key,
    required this.onAboutPressed,
    required this.onSkillsPressed,
    required this.onExperiencePressed,
    required this.onProjectsPressed,
    required this.onEducationPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    const desktopNavbarBreakpoint = 900.0;

    if (width < desktopNavbarBreakpoint) {
      return _MobileNavbar(
        onAboutPressed: onAboutPressed,
        onSkillsPressed: onSkillsPressed,
        onExperiencePressed: onExperiencePressed,
        onProjectsPressed: onProjectsPressed,
        onEducationPressed: onEducationPressed,
        onContactPressed: onContactPressed,
      );
    }

    return _DesktopNavbar(
      onAboutPressed: onAboutPressed,
      onSkillsPressed: onSkillsPressed,
      onExperiencePressed: onExperiencePressed,
      onProjectsPressed: onProjectsPressed,
      onEducationPressed: onEducationPressed,
      onContactPressed: onContactPressed,
    );
  }
}

class _DesktopNavbar extends StatelessWidget {
  final VoidCallback onAboutPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onExperiencePressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onEducationPressed;
  final VoidCallback onContactPressed;

  const _DesktopNavbar({
    required this.onAboutPressed,
    required this.onSkillsPressed,
    required this.onExperiencePressed,
    required this.onProjectsPressed,
    required this.onEducationPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      decoration: BoxDecoration(
        color: context.colors.surface,
        border: Border(bottom: BorderSide(color: context.theme.dividerColor)),
      ),
      child: Row(
        children: [
          const _Logo(),
          const Spacer(),
          _NavItem(label: l10n.navAbout, onPressed: onAboutPressed),
          _NavItem(label: l10n.navSkills, onPressed: onSkillsPressed),
          _NavItem(label: l10n.navExperience, onPressed: onExperiencePressed),
          _NavItem(label: l10n.navProjects, onPressed: onProjectsPressed),
          _NavItem(label: l10n.navEducation, onPressed: onEducationPressed),
          _NavItem(label: l10n.navContact, onPressed: onContactPressed),
          const SizedBox(width: AppSpacing.lg),
          const _LanguageButton(),
          const SizedBox(width: AppSpacing.xs),
          const _ThemeButton(),
        ],
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  const _LanguageButton();

  @override
  Widget build(BuildContext context) {
    final currentLanguage = Localizations.localeOf(context).languageCode;

    return OutlinedButton(
      onPressed: () {
        context.read<LocaleCubit>().toggleLocale();
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(44, 42),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.medium),
        ),
      ),
      child: Text(currentLanguage == 'en' ? 'AR' : 'EN'),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Text(
      'IA.',
      style: context.textTheme.titleLarge?.copyWith(
        color: context.colors.primary,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.8,
      ),
    );
  }
}

class _MobileNavbar extends StatelessWidget {
  final VoidCallback onAboutPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onExperiencePressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onEducationPressed;
  final VoidCallback onContactPressed;

  const _MobileNavbar({
    required this.onAboutPressed,
    required this.onSkillsPressed,
    required this.onExperiencePressed,
    required this.onProjectsPressed,
    required this.onEducationPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: context.colors.surface,
        border: Border(bottom: BorderSide(color: context.theme.dividerColor)),
      ),
      child: Row(
        children: [
          const _Logo(),
          const Spacer(),
          const _LanguageButton(),
          const SizedBox(width: AppSpacing.xs),
          const _ThemeButton(),
          const SizedBox(width: AppSpacing.xs),
          IconButton(
            onPressed: () {
              _showMobileMenu(context);
            },
            icon: const Icon(Icons.menu_rounded),
          ),
        ],
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              0,
              AppSpacing.lg,
              AppSpacing.lg,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _MobileNavItem(label: l10n.navAbout, onPressed: onAboutPressed),
                _MobileNavItem(
                  label: l10n.navSkills,
                  onPressed: onSkillsPressed,
                ),
                _MobileNavItem(
                  label: l10n.navExperience,
                  onPressed: onExperiencePressed,
                ),
                _MobileNavItem(
                  label: l10n.navProjects,
                  onPressed: onProjectsPressed,
                ),
                _MobileNavItem(
                  label: l10n.navEducation,
                  onPressed: onEducationPressed,
                ),
                _MobileNavItem(
                  label: l10n.navContact,
                  onPressed: onContactPressed,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _MobileNavItem({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label, style: context.textTheme.titleMedium),
      trailing: Icon(
        Directionality.of(context) == TextDirection.rtl
            ? Icons.arrow_back_ios_new_rounded
            : Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
      onTap: () {
        Navigator.of(context).pop();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          onPressed();
        });
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _NavItem({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      child: TextButton(onPressed: onPressed, child: Text(label)),
    );
  }
}

class _ThemeButton extends StatelessWidget {
  const _ThemeButton();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return IconButton(
      onPressed: () {
        context.read<ThemeCubit>().toggleTheme();
      },
      tooltip: context.isDarkMode
          ? l10n.lightModeTooltip
          : l10n.darkModeTooltip,
      icon: Icon(
        context.isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
      ),
    );
  }
}
