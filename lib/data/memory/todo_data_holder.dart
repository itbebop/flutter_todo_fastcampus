import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class TodoDataHolder extends GetxController {
  final RxList<Todo> todoList = <Todo>[].obs;

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
    todoList.refresh();
    // build를 다시함
  }

  void addTodo() async {
    final result = await WriteTodoDialog().show();
    // mounted 체크 안해도 WriteTodoDialog가 뜨고 사라졌을 때 나온다는 게 흐름상 보장됨
    if (result != null) {
      todoList.add(Todo(
        id: DateTime.now().millisecond,
        title: result.text,
        dueDate: result.dateTime,
      ));
      // rxList에서 add를 호출할 때는 안에서 refresh()를 호출하므로 따로 호출하진 않음
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
