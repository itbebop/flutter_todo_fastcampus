import 'package:fast_app_base/data/memory/vo/todo_data_notifier.dart';
import 'package:fast_app_base/data/memory/vo/todo_status.dart';
import 'package:fast_app_base/data/memory/vo/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
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
}

extension TdoDataHolderContextExtension on BuildContext {
  TodoDataHolder get holder => TodoDataHolder._of(this);
}
