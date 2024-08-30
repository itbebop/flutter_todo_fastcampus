import 'package:fast_app_base/data/memory/todo_status.dart';

class Todo {
  Todo({
    required this.id,
    required this.title,
    required this.dueDate,
    this.status = TodoStatus.incomplete,
    required DateTime createdTime,
    this.modifyTime,
  }) : createdTime = DateTime.now();
  // createdTime은 생성자가 호출되는 시점에 만들어지면 되므로
  int id;
  String title;
  final DateTime createdTime;
  DateTime? modifyTime;
  DateTime dueDate;
  TodoStatus status;

  Todo copyWith({
    int? id,
    String? title,
    DateTime? createdTime,
    DateTime? dueDate,
    DateTime? modifyTime,
    TodoStatus status = TodoStatus.incomplete,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      createdTime: createdTime ?? this.createdTime,
      modifyTime: modifyTime,
      dueDate: dueDate ?? DateTime.now(),
      status: status,
    );
  }
}
