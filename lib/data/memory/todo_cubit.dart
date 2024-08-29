import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoBlocState> {
  TodoCubit(super.initialState);
  // TodoCubit() : super(const TodoBlocState(BlocStatus.initial, todoList: <Todo>[]));
  void addTodo() async {
    // final oldTodoList = List.of(state.todoList); // state는 변경이 안되므로, 수정이 가능한 List를 만듬

    final result = await WriteTodoDialog().show();
    // mounted 체크 안해도 WriteTodoDialog가 뜨고 사라졌을 때 나온다는 게 흐름상 보장됨
    if (result != null) {
      final copiedOldTodoList = state.todoList; // state는 변경이 안되므로, 수정이 가능한 List를 만듬
      copiedOldTodoList.add(Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime,
      ));
      emit(state.copyWith(todoList: copiedOldTodoList));
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
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      todoList.refresh();
    }
  }

  void removeTodo(Todo todo) {
    todoList.remove(todo);
    todoList.refresh();
  }
}

mixin class TodoDataProvider {
  late final TodoDataHolder todoData = Get.find();
}
