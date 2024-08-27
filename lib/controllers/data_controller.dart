import 'package:nacchofer31_portfolio/portfolio.dart';

class DataController extends Controller<DataController> {
  DataController(
    this.dataSource,
  );

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
    setState(
      profileModel:
          await AboutRepositoryImpl(dataSource: dataSource).getProfileModel(),
      aboutModel:
          await AboutRepositoryImpl(dataSource: dataSource).getAboutModel(),
      experienceList: await ExperienceRepositoryImpl(dataSource: dataSource)
          .getExperienceList(),
      educationList: await EducationRepositoryImpl(dataSource: dataSource)
          .getEducationList(),
      skillList: await AboutRepositoryImpl(dataSource: dataSource).getSkills(),
    );
  }
}
