import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/data/memory/vo/todo_data_holder.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TodoDataHolder.of(context).notifier,
      builder: (context, todoList, child) {
        // todoList는 notifier의 value와 같음
        return todoList.isEmpty
            ? ' 할일을 작성해보세요.'.text.size(30).makeCentered()
            : Column(
                children: todoList.map((e) => e.title.text.make()).toList(),
              );
      },
    );
  }
}
