import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoDataProvider = StateNotifierProvider<TodoDataHolder, List<Todo>>((ref) => TodoDataHolder());

class TodoDataHolder extends StateNotifier<List<Todo>> {
  TodoDataHolder() : super([]);

  void addTodo() async {
    final result = await WriteTodoDialog().show();
    if (result != null) {
      state.add(Todo(
        // state => state_notifier
        id: DateTime.now().millisecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime,
        createdTime: DateTime.now(),
      ));
      state = List.of(state); // refresh
    }
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
    state = List.of(state); // state에 새로운 값 세팅해주는 건 getX의 refresh()와 동일한 동작
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      state = List.of(state); // state에 새로운 값 세팅해주는 건 getX의 refresh()와 동일한 동작
    }
  }

  void removeTodo(Todo todo) {
    state.remove(todo);
    state = List.of(state); // state에 새로운 값 세팅해주는 건 getX의 refresh()와 동일한 동작
  }
}

extension TodoListHolderProvider on WidgetRef {
  TodoDataHolder get readTodoHolder => read(todoDataProvider.notifier); // read앞에 this는 본인이라 생략함
}
