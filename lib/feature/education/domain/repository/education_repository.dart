import 'package:nacchofer31_portfolio/portfolio.dart';

abstract class EducationRepository {
  Future<List<EducationModel>> getEducationList();
}
