import 'package:nacchofer31_portfolio/portfolio.dart';

class EducationRepositoryImpl extends EducationRepository {
  EducationRepositoryImpl({required this.dataSource});

  final ContentDataSource dataSource;

  @override
  Future<List<EducationModel>> getEducationList() async {
    final data = await dataSource.getData('assets/raw/education.json');
    return (data['college'] as List)
        .map(
          (center) => EducationModel(
            collegeName: center['collegeName'],
            icon: center['icon'],
            date: center['date'],
            location: center['location'],
            description: center['description'],
          ),
        )
        .toList();
  }
}
