import 'package:nacchofer31_portfolio/portfolio.dart';

class DataController extends Controller<DataController> {
  DataController(this.dataSource);

  final ContentDataSource dataSource;

  ProfileModel profileModel = ProfileModel();
  AboutModel aboutModel = AboutModel();
  List<ExperienceModel> experienceList = [];
  List<EducationModel> educationList = [];
  List<SkillModel> skillList = [];

  @override
  void setState({
    ProfileModel? profileModel,
    AboutModel? aboutModel,
    List<ExperienceModel>? experienceList,
    List<EducationModel>? educationList,
    List<SkillModel>? skillList,
  }) {
    this.profileModel = profileModel ?? this.profileModel;
    this.aboutModel = aboutModel ?? this.aboutModel;
    this.experienceList = experienceList ?? this.experienceList;
    this.educationList = educationList ?? this.educationList;
    this.skillList = skillList ?? this.skillList;

    updateStream(this);
  }

  Future<void> loadAllData() async {
    final profileData = await dataSource.getData('assets/raw/profile.json');
    final aboutData = await dataSource.getData('assets/raw/about.json');
    final experienceData =
        await dataSource.getData('assets/raw/experience.json');
    final skillsData = await dataSource.getData('assets/raw/skills.json');
    final educationData = await dataSource.getData('assets/raw/education.json');

    setState(
      profileModel: ProfileModel.fromJson(profileData),
      aboutModel: AboutModel.fromJson(aboutData),
      experienceList: (experienceData['clients'] as List)
          .map((e) => ExperienceModel.fromJson(e))
          .toList(),
      educationList: (educationData['college'] as List)
          .map((e) => EducationModel.fromJson(e))
          .toList(),
      skillList: (skillsData['skills'] as List)
          .map((e) => SkillModel.fromJson(e))
          .toList(),
    );
  }
}
