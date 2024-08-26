import 'dart:convert';

class ExperienceModel {
  final String clientName;
  final String icon;
  final String date;
  final String location;
  final String description;
  final List<TaskModel> tasks;

  ExperienceModel({
    this.clientName = '',
    this.icon = '',
    this.date = '',
    this.location = '',
    this.description = '',
    this.tasks = const [],
  });

  Map<String, dynamic> toJson() => {
        'clientName': clientName,
        'icon': icon,
        'date': date,
        'location': location,
        'description': description,
        'tasks': tasks.map((e) => e.toJson()).toList(),
      };

  factory ExperienceModel.fromJson(Map<String, dynamic> map) => ExperienceModel(
        clientName: map['clientName'],
        icon: map['icon'],
        date: map['date'],
        location: map['location'],
        description: map['description'],
        tasks: List<TaskModel>.from(
          map['tasks']?.map(
            (e) => TaskModel.fromJson(e),
          ),
        ),
      );

  String toRawJson() => json.encode(toJson());

  factory ExperienceModel.fromRawJson(String raw) =>
      ExperienceModel.fromJson(json.decode(raw));
}

class TaskModel {
  final String name;
  final String description;

  TaskModel({
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
      };

  factory TaskModel.fromJson(Map<String, dynamic> map) =>
      TaskModel(name: map['name'] ?? '', description: map['description'] ?? '');

  String toRawJson() => json.encode(toJson());
}
