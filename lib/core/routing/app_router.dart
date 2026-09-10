import 'package:flutter/material.dart';

import '../../data/models/project_model.dart';
import '../../data/portfolio_data/projects_data.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/projects/project_details/project_details_screen.dart';

abstract final class AppRouter {
  static const String home = '/';
  static const String projectDetails = '/project';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name ?? home;

    if (routeName == home) {
      return _buildRoute(const HomeScreen(), settings);
    }

    if (routeName.startsWith('$projectDetails/')) {
      final slug = routeName
          .substring(projectDetails.length + 1)
          .split('?')
          .first
          .trim();

      final project = _findProject(slug);

      if (project != null) {
        return _buildRoute(ProjectDetailsScreen(project: project), settings);
      }

      return _buildRoute(const HomeScreen(), settings);
    }

    return _buildRoute(const HomeScreen(), settings);
  }

  static String projectRoute(String slug) {
    return '$projectDetails/$slug';
  }

  static MaterialPageRoute<dynamic> _buildRoute(
    Widget page,
    RouteSettings settings,
  ) {
    return MaterialPageRoute<dynamic>(builder: (_) => page, settings: settings);
  }

  static ProjectModel? _findProject(String slug) {
    for (final project in ProjectsData.projects) {
      if (project.slug == slug) {
        return project;
      }
    }

    return null;
  }
}
