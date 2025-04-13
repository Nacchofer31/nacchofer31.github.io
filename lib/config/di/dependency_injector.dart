import 'package:nacchofer31_portfolio/portfolio.dart';

final class DependencyInjector {
  static void init() async {
    final getIt = GetIt.instance;
    final dataSource = ContentDataSource();

    //REPOSITORIES
    getIt.registerFactory<AboutRepository>(
      () => AboutRepositoryImpl(dataSource: dataSource),
    );
    getIt.registerFactory<ExperienceRepository>(
      () => ExperienceRepositoryImpl(dataSource: dataSource),
    );
    getIt.registerFactory<EducationRepository>(
      () => EducationRepositoryImpl(dataSource: dataSource),
    );
    getIt.registerFactory<ProjectsRepository>(
      () => ProjectsRepositoryImpl(dataSource: dataSource),
    );

    //CUBITS
    getIt.registerFactory<HomeCubit>(
      () => HomeCubit(
        getPortfolioDataUseCase: GetPortfolioDataUseCase(
          aboutRepository: getIt.get<AboutRepository>(),
          experienceRepository: getIt.get<ExperienceRepository>(),
          educationRepository: getIt.get<EducationRepository>(),
          projectsRepository: getIt.get<ProjectsRepository>(),
        ),
      ),
    );
  }
}
