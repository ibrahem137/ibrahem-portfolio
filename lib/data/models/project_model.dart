class ProjectModel {
  final String id;
  final String slug;

  final String titleKey;
  final String shortDescriptionKey;
  final String fullDescriptionKey;
  final String typeKey;
  final String roleKey;

  final String coverImage;
  final List<String> screenshots;
  final List<String> technologies;
  final List<String> featureKeys;

  final String githubUrl;
  final String? liveUrl;
  final String year;
  final bool featured;

  const ProjectModel({
    required this.id,
    required this.slug,
    required this.titleKey,
    required this.shortDescriptionKey,
    required this.fullDescriptionKey,
    required this.typeKey,
    required this.roleKey,
    required this.coverImage,
    required this.screenshots,
    required this.technologies,
    required this.featureKeys,
    required this.githubUrl,
    required this.liveUrl,
    required this.year,
    required this.featured,
  });
}
