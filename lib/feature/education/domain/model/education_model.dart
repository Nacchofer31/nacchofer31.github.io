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

class EducationModeld {
  final String collegeName;
  final String icon;
  final String date;
  final String location;
  final String description;

  EducationModeld({
    this.collegeName = '',
    this.icon = '',
    this.date = '',
    this.location = '',
    this.description = '',
  });

  factory EducationModeld.fromJson(Map<String, dynamic> map) => EducationModeld(
        collegeName: map['collegeName'],
        icon: map['icon'],
        date: map['date'],
        location: map['location'],
        description: map['description'],
      );
}
