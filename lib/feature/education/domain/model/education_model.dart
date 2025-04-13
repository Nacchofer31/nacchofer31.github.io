import 'package:nacchofer31_portfolio/portfolio.dart';

part 'education_model.freezed.dart';

@freezed
class EducationModel with _$EducationModel {
  factory EducationModel({
    @Default('') String collegeName,
    @Default('') String icon,
    @Default('') String date,
    @Default('') String location,
    @Default('') String description,
  }) = _EducationModel;
}
