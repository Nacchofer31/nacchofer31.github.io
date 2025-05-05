import 'package:nacchofer31_portfolio/portfolio.dart';

class ProjectsRepositoryImpl extends ProjectsRepository {
  ProjectsRepositoryImpl({required this.dataSource});

  final ContentDataSource dataSource;

  @override
  Future<List<ProjectModel>> getProjects() async {
    final data = await dataSource.getData('assets/raw/projects.json');
    return (data['projects'] as List)
        .map(
          (project) => ProjectModel(
            name: project['name'],
            logo: project['logo'],
            type: project['type'],
            description: project['description'],
            skills: project['skills'],
            techIcon: project['techLogoPath'],
            iconColor: project['iconColor'],
            screenshots: List<String>.from(project['screenshots']),
            appStoreLink: project['appStoreLink'],
            playStoreLink: project['playStoreLink'],
            webLink: project['webLink'],
          ),
        )
        .toList();
  }
}
