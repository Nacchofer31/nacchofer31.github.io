import 'dart:convert';

class EducationModel {
  final String collegeName;
  final String icon;
  final String date;
  final String location;
  final String description;

  EducationModel({
    this.collegeName = '',
    this.icon = '',
    this.date = '',
    this.location = '',
    this.description = '',
  });

  Map<String, dynamic> toJson() => {
        'collegeName': collegeName,
        'icon': icon,
        'date': date,
        'location': location,
        'description': description,
      };

  factory EducationModel.fromJson(Map<String, dynamic> map) => EducationModel(
        collegeName: map['collegeName'],
        icon: map['icon'],
        date: map['date'],
        location: map['location'],
        description: map['description'],
      );

  String toRawJson() => json.encode(toJson());

  factory EducationModel.fromRawJson(String raw) =>
      EducationModel.fromJson(json.decode(raw));
}
