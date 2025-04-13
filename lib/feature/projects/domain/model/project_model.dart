import 'package:nacchofer31_portfolio/portfolio.dart';

part 'project_model.freezed.dart';

@freezed
class ProjectModel with _$ProjectModel {
  factory ProjectModel({
    @Default('') String name,
    @Default('') String logo,
    @Default('') String techIcon,
    @Default('') String type,
    @Default('') String description,
    @Default('') String skills,
    String? playStoreLink,
    String? appStoreLink,
    String? webLink,
    @Default(<String>[]) List<String> screenshots,
  }) = _ProjectModel;
}
