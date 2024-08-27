import 'package:nacchofer31_portfolio/portfolio.dart';

abstract class AboutRepository {
  Future<AboutModel> getAboutModel();
  Future<ProfileModel> getProfileModel();
  Future<List<SkillModel>> getSkills();
}
