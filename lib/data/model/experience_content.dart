class ExperienceModel {
  final String clientName;
  final String icon;
  final String date;
  final String description;
  final List<_TaskModel> tasks;

  ExperienceModel({
    this.clientName = "",
    this.icon = "",
    this.date = "",
    this.description = "",
    this.tasks = const [],
  });

  Map<String, dynamic> toJson() => {
        'clientName': clientName,
        'icon': icon,
        'date': date,
        'description': description,
        'tasks': tasks.map((e) => e.toJson()).toList(),
      };

  factory ExperienceModel.fromJson(Map<String, dynamic> map) => ExperienceModel(
      clientName: map['clientName'],
      icon: map['icon'],
      date: map['date'],
      description: map['description'],
      tasks: List<_TaskModel>.from(
          map['tasks']?.map((e) => _TaskModel.fromJson(e))));
}

class _TaskModel {
  final String name;
  final String description;

  _TaskModel({required this.name, required this.description});

  Map<String, dynamic> toJson() => {'name': name, 'description': description};

  factory _TaskModel.fromJson(Map<String, dynamic> map) => _TaskModel(
      name: map['name'] ?? '', description: map['description'] ?? '');
}
