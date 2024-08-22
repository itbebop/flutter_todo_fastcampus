import 'package:fast_app_base/data/memory/vo/todo_data_notifier.dart';
import 'package:fast_app_base/data/memory/vo/todo_status.dart';
import 'package:fast_app_base/data/memory/vo/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter/material.dart';

class TodoDataHolder extends InheritedWidget {
  final TodoDataNotifier notifier;

  const TodoDataHolder({
    super.key,
    required super.child,
    required this.notifier,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TodoDataHolder _of(BuildContext context) {
    TodoDataHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
    return inherited;
  }

  void changeTodoStatus(Todo todo) async {
    switch (todo.status) {
      case TodoStatus.incomplete:
        todo.status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠습니까').show();
        result?.runIfSuccess((data) {
          // 확인을 누른 경우
          todo.status = TodoStatus.incomplete;
        });
    }
    notifier.notify();
  }

  void addTodo() async {
    final result = await WriteTodoDialog().show();
    // mounted 체크 안해도 WriteTodoDialog가 뜨고 사라졌을 때 나온다는 게 흐름상 보장됨
    if (result != null) {
      notifier.addTodo(Todo(
        id: DateTime.now().millisecond,
        title: result.text,
        dueDate: result.dateTime,
      ));
    }
  }
}

extension TdoDataHolderContextExtension on BuildContext {
  TodoDataHolder get holder => TodoDataHolder._of(this);
}
