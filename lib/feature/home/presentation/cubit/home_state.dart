part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required HomeModel homeModel,
    @Default(Routes.about) Routes selectedPage,
  }) = _HomeState;
}
