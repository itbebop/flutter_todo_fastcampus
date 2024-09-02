import 'package:fast_app_base/data/memory/bloc/bloc_status.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/data/memory/bloc/todo_event.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoBlocState> {
  TodoBloc() : super(const TodoBlocState(BlocStatus.initial, todoList: <Todo>[])) {
    on<TodoAddEvent>(_addTodo);
    on<TodoStatusUpdateEvent>(_changeTodoStatus);
    on<TodoContentUpdateEvent>(_editTodo);
    on<TodoRemoveEvent>(_removeTodo);
  }
  void _addTodo(TodoAddEvent event, Emitter<TodoBlocState> emit) async {
    final result = await WriteTodoDialog().show();
    // mounted 체크 안해도 WriteTodoDialog가 뜨고 사라졌을 때 나온다는 게 흐름상 보장됨
    if (result != null) {
      final copiedOldTodoList = List.of(state.todoList); // state는 변경이 안되므로, 수정이 가능한 List를 만듬
      copiedOldTodoList.add(Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime,
        createdTime: DateTime.now(),
      ));
      emitNewList(copiedOldTodoList, emit);
    }
  }

  void _changeTodoStatus(TodoStatusUpdateEvent event, Emitter<TodoBlocState> emit) async {
    final copiedOldTodoList = List.of(state.todoList); // state는 변경이 안되므로, 수정이 가능한 List를 만듬
    final todo = event.updatedTodo;
    final todoIndex = copiedOldTodoList.indexWhere((element) => element.id == todo.id); // todo가 존재하는 위치 파악

    TodoStatus status = todo.status;
    switch (todo.status) {
      case TodoStatus.incomplete:
        status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠습니까').show();
        result?.runIfSuccess((data) {
          // 확인을 누른 경우
          status = TodoStatus.incomplete;
        });
    }
    copiedOldTodoList[todoIndex] = todo.copyWith(status: status);

    emitNewList(copiedOldTodoList, emit);
  }

  void _editTodo(TodoContentUpdateEvent event, Emitter<TodoBlocState> emit) async {
    final todo = event.updatedTodo;
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.dateTime;

      final oldCopiedList = List<Todo>.from(state.todoList);
      oldCopiedList[oldCopiedList.indexOf(todo)] = todo.copyWith(
        title: result.text,
        dueDate: result.dateTime,
        modifyTime: DateTime.now(),
      );
      emitNewList(oldCopiedList, emit);
    }
  }

  void _removeTodo(TodoRemoveEvent event, Emitter<TodoBlocState> emit) {
    final oldCopiedList = List<Todo>.from(state.todoList);
    final todo = event.removedTodo;
    oldCopiedList.removeWhere((element) => element.id == todo.id);
    emitNewList(oldCopiedList, emit);
  }

  void emitNewList(List<Todo> oldCopiedList, Emitter<TodoBlocState> emit) {
    emit(state.copyWith(todoList: oldCopiedList));
  }
}
