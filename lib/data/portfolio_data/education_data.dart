import '../models/education_model.dart';

abstract final class EducationData {
  static const education = EducationModel(
    university: 'University of Aleppo',
    faculty: 'Faculty of Information Engineering',
    major: 'Software Engineering',
    status: 'Fifth-Year Student',
    expectedGraduation: '2027',
  );
}
