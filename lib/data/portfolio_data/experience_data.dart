import '../models/experience_model.dart';

abstract final class ExperienceData {
  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      role: 'Mobile App Development Intern',
      company: 'AutoMata4 Group',
      period: 'Internship',
      location: 'Aleppo, Syria',
      description: 'Worked on Flutter mobile application development while improving practical skills in UI implementation, application structure, and development workflows.',
      highlights: [
        'Flutter & Dart',
        'Mobile UI Development',
        'Git & GitHub',
        'Team Collaboration',
      ],
    ),
  ];
}
