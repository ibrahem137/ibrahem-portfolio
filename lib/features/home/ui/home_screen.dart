import 'package:flutter/material.dart';
import 'package:ibrahem_portfolio/core/widgets/reveal_on_scroll.dart';
import 'package:ibrahem_portfolio/features/certificates/widgets/certificates_section.dart';
import 'package:ibrahem_portfolio/features/contact/ui/contact_section.dart';
import 'package:ibrahem_portfolio/features/contact/ui/portfolio_footer.dart';
import 'package:ibrahem_portfolio/features/education/widgets/education_section.dart';
import 'package:ibrahem_portfolio/features/experience/widgets/experience_section.dart';
import 'package:ibrahem_portfolio/features/projects/widgets/projects_section.dart';

import '../../about/widgets/about_section.dart';
import '../../hero/widgets/hero_section.dart';
import '../../skills/widgets/skills_section.dart';
import 'widgets/portfolio_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PortfolioNavbar(
            onAboutPressed: () => _scrollToSection(_aboutKey),
            onSkillsPressed: () => _scrollToSection(_skillsKey),
            onExperiencePressed: () => _scrollToSection(_experienceKey),
            onProjectsPressed: () => _scrollToSection(_projectsKey),
            onEducationPressed: () => _scrollToSection(_educationKey),
            onContactPressed: () => _scrollToSection(_contactKey),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeroSection(
                    onViewWorkPressed: () => _scrollToSection(_projectsKey),
                  ),
                  KeyedSubtree(
                    key: _aboutKey,
                    child: const RevealOnScroll(child: AboutSection()),
                  ),
                  KeyedSubtree(
                    key: _skillsKey,
                    child: const RevealOnScroll(child: SkillsSection()),
                  ),
                  KeyedSubtree(
                    key: _experienceKey,
                    child: const RevealOnScroll(child: ExperienceSection()),
                  ),
                  KeyedSubtree(
                    key: _projectsKey,
                    child: RevealOnScroll(child: ProjectsSection()),
                  ),
                  KeyedSubtree(
                    key: _educationKey,
                    child: const RevealOnScroll(child: EducationSection()),
                  ),
                  const CertificatesSection(),
                  KeyedSubtree(
                    key: _contactKey,
                    child: const RevealOnScroll(child: ContactSection()),
                  ),
                  const PortfolioFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _scrollToSection(GlobalKey key) async {
    final targetContext = key.currentContext;

    if (targetContext == null) {
      return;
    }

    await Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: 0,
    );
  }
}
