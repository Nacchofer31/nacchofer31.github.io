import 'package:nacchofer31_portfolio/portfolio.dart';

part 'task_model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  factory TaskModel({
    @Default('') String name,
    @Default('') String description,
  }) = _TaskModel;
}
