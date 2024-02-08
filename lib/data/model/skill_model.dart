import 'dart:convert';

class SkillModel {
  final String name;
  final String description;
  final String techLogoPath;

  SkillModel({
    required this.name,
    required this.description,
    required this.techLogoPath,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'techLogoPath': techLogoPath,
    };
  }

  factory SkillModel.fromJson(Map<String, dynamic> map) {
    return SkillModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      techLogoPath: map['techLogoPath'] ?? '',
    );
  }

  String toRawJson() => json.encode(toJson());

  factory SkillModel.fromRawJson(String source) =>
      SkillModel.fromJson(json.decode(source));
}
