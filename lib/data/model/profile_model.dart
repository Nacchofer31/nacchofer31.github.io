import 'dart:convert';

class ProfileModel {
  final String fullName;
  final String role;
  final String techUrl;
  final String avatarPath;

  ProfileModel({
    this.fullName = "",
    this.role = "",
    this.techUrl = "",
    this.avatarPath = "",
  });

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'role': role,
        'techUrl': techUrl,
        'avatarPath': avatarPath,
      };

  factory ProfileModel.fromJson(Map<String, dynamic> map) => ProfileModel(
      fullName: map['fullName'] ?? '',
      role: map['role'],
      techUrl: map['techUrl'],
      avatarPath: map['avatarPath']);

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromRawJson(String raw) =>
      ProfileModel.fromJson(json.decode(raw));
}
