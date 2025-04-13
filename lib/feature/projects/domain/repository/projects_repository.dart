import 'package:nacchofer31_portfolio/portfolio.dart';

abstract class ProjectsRepository {
  Future<List<ProjectModel>> getProjects();
}
