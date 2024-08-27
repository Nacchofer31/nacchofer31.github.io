import 'package:nacchofer31_portfolio/portfolio.dart';

class AboutRepositoryImpl extends AboutRepository {
  AboutRepositoryImpl({required this.dataSource});

  final ContentDataSource dataSource;

  @override
  Future<AboutModel> getAboutModel() async {
    final data = await dataSource.getData('assets/raw/about.json');
    return AboutModel(
      description: data['description'],
    );
  }

  @override
  Future<ProfileModel> getProfileModel() async {
    final data = await dataSource.getData('assets/raw/profile.json');
    return ProfileModel(
      fullName: data['fullName'],
      role: data['role'],
      avatarPath: data['avatarPath'],
    );
  }

  @override
  Future<List<SkillModel>> getSkills() async {
    final data = await dataSource.getData('assets/raw/skills.json');
    return (data['skills'] as List)
        .map(
          (skill) => SkillModel(
            name: skill['name'],
            description: skill['description'],
            techLogoPath: skill['techLogoPath'],
          ),
        )
        .toList();
  }
}
