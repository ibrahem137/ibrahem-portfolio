import 'package:flutter/material.dart';

import '../models/skill_model.dart';

abstract final class SkillsData {
  static const List<SkillModel> skills = [
    SkillModel(
      title: 'Mobile & Web',
      icon: Icons.devices_rounded,
      skills: ['Flutter', 'Dart', 'Responsive Design', 'Material Design'],
    ),
    SkillModel(
      title: 'Architecture',
      icon: Icons.account_tree_outlined,
      skills: [
        'Clean Architecture',
        'Feature-Based Architecture',
        'Repository Pattern',
        'Dependency Injection',
      ],
    ),
    SkillModel(
      title: 'State Management',
      icon: Icons.hub_outlined,
      skills: ['Bloc', 'Cubit'],
    ),
    SkillModel(
      title: 'API & Networking',
      icon: Icons.api_rounded,
      skills: ['REST APIs', 'Dio', 'Retrofit', 'JSON Serialization'],
    ),
    SkillModel(
      title: 'Data & Services',
      icon: Icons.storage_rounded,
      skills: [
        'Hive',
        'Shared Preferences',
        'Secure Storage',
        'Firebase',
        'Supabase',
      ],
    ),
    SkillModel(
      title: 'Tools',
      icon: Icons.build_outlined,
      skills: ['Git', 'GitHub', 'Postman', 'VS Code', 'Figma'],
    ),
  ];
}
