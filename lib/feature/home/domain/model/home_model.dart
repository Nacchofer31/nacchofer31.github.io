import 'package:nacchofer31_portfolio/portfolio.dart';

part 'home_model.freezed.dart';

@freezed
class HomeModel with _$HomeModel {
  factory HomeModel({
    required ProfileModel profileModel,
    required AboutModel aboutModel,
    @Default(<ExperienceModel>[]) List<ExperienceModel> experienceList,
    @Default(<EducationModel>[]) List<EducationModel> educationList,
    @Default(<SkillModel>[]) List<SkillModel> skillList,
    @Default(<ProjectModel>[]) List<ProjectModel> projects,
  }) = _HomeModel;
}
