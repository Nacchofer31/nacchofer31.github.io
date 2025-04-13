import 'package:nacchofer31_portfolio/portfolio.dart';

class GetPortfolioDataUseCase {
  @protected
  final AboutRepository aboutRepository;
  @protected
  final ExperienceRepository experienceRepository;
  @protected
  final EducationRepository educationRepository;
  @protected
  final ProjectsRepository projectsRepository;

  GetPortfolioDataUseCase({
    required this.aboutRepository,
    required this.experienceRepository,
    required this.educationRepository,
    required this.projectsRepository,
  });

  Future<HomeModel> call() async {
    final aboutModel = await aboutRepository.getAboutModel();
    final profileModel = await aboutRepository.getProfileModel();
    final skills = await aboutRepository.getSkills();
    final educationList = await educationRepository.getEducationList();
    final experienceList = await experienceRepository.getExperienceList();
    final projectsList = await projectsRepository.getProjects();

    return HomeModel(
      profileModel: profileModel,
      aboutModel: aboutModel,
      skillList: skills,
      educationList: educationList,
      experienceList: experienceList,
      projects: projectsList,
    );
  }
}
