import 'package:nacchofer31_portfolio/portfolio.dart';

abstract class ExperienceRepository {
  Future<List<ExperienceModel>> getExperienceList();
}
