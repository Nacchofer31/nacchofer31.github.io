import 'package:nacchofer31_portfolio/portfolio.dart';

class ExperienceRepositoryImpl extends ExperienceRepository {
  ExperienceRepositoryImpl({required this.dataSource});

  final ContentDataSource dataSource;

  @override
  Future<List<ExperienceModel>> getExperienceList() async {
    final data = await dataSource.getData('assets/raw/experience.json');
    return (data['clients'] as List)
        .map(
          (client) => ExperienceModel(
            clientName: client['clientName'],
            icon: client['icon'],
            date: client['date'],
            location: client['location'],
            description: client['description'],
            tasks: (client['tasks'] as List)
                .map(
                  (task) => TaskModel(
                    description: task['description'],
                    name: task['name'],
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }
}
