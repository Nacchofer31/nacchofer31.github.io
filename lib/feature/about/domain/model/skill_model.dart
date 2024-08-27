import 'package:nacchofer31_portfolio/portfolio.dart';

part 'skill_model.freezed.dart';

@freezed
class SkillModel with _$SkillModel {
  factory SkillModel({
    @Default('') String name,
    @Default('') String description,
    @Default('') String techLogoPath,
  }) = _SkillModel;
}
