import 'dart:convert';

class ProfileModel {
  ProfileModel({
    this.fullName = '',
    this.role = '',
    this.avatarPath = '',
  });

  final String fullName;
  final String role;
  final String avatarPath;

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'role': role,
        'avatarPath': avatarPath,
      };

  factory ProfileModel.fromJson(Map<String, dynamic> map) => ProfileModel(
        fullName: map['fullName'] ?? '',
        role: map['role'],
        avatarPath: map['avatarPath'],
      );

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromRawJson(String raw) => ProfileModel.fromJson(
        json.decode(raw),
      );
}
