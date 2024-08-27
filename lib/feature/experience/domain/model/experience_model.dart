import 'package:nacchofer31_portfolio/portfolio.dart';

part 'experience_model.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: true)
class ExperienceModel with _$ExperienceModel {
  factory ExperienceModel({
    @Default('') String clientName,
    @Default('') String icon,
    @Default('') String date,
    @Default('') String location,
    @Default('') String description,
    @Default(<TaskModel>[]) List<TaskModel> tasks,
  }) = _ExperienceModel;
}
