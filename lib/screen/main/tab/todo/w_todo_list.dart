import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WidgetRef 추가
    final todoList = ref.watch(todoDataProvider); // 전역으로 선언한 todoDataProvider를 watch로

    return todoList.isEmpty
        ? ' 할일을 작성해보세요.'.text.size(30).makeCentered()
        : Column(
            children: todoList.map((e) => TodoItem(e)).toList(),
          );
  }
}
