import 'package:nacchofer31_portfolio/portfolio.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getPortfolioDataUseCase})
      : super(
          HomeState(
            homeModel: HomeModel(
              profileModel: ProfileModel(),
              aboutModel: AboutModel(),
            ),
          ),
        ) {
    getData();
  }

  final GetPortfolioDataUseCase getPortfolioDataUseCase;

  void getData() async {
    final portfolioData = await getPortfolioDataUseCase();
    emitIfNotClosed(
      state.copyWith(
        homeModel: portfolioData,
      ),
    );
  }

  void changePage(Routes selectedRoute) => emitIfNotClosed(
        state.copyWith(
          selectedPage: selectedRoute,
        ),
      );
}
