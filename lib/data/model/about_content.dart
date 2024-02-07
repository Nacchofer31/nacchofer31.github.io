import 'dart:convert';

class AboutModel {
  final String description;

  AboutModel({this.description = ""});

  Map<String, dynamic> toJson() {
    return {'description': description};
  }

  factory AboutModel.fromJson(Map<String, dynamic> map) {
    return AboutModel(description: map['description'] ?? '');
  }

  String toRawJson() => json.encode(toJson());

  factory AboutModel.fromRawJson(String source) =>
      AboutModel.fromJson(json.decode(source));
}
