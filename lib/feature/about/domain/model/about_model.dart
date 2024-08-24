import 'dart:convert';

class AboutModel {
  final String description;

  AboutModel({this.description = ''});

  Map<String, dynamic> toJson() => {'description': description};

  factory AboutModel.fromJson(Map<String, dynamic> map) =>
      AboutModel(description: map['description'] ?? '');

  String toRawJson() => json.encode(toJson());

  factory AboutModel.fromRawJson(String source) =>
      AboutModel.fromJson(json.decode(source));
}
