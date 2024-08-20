import 'package:fast_app_base/data/memory/vo/vo_todo.dart';
import 'package:flutter/material.dart';

class TodoDataNotifier extends ValueNotifier<List<Todo>> {
  //TodoDataNotifier(super.value);
  // 초기 앱을 켰을 때는 빈 리스트일 것이므로
  // 위와 같이 초기화하지 않고 아래처럼 빈 리스트로 초기화해줌
  TodoDataNotifier() : super([]);

  void addTodo(Todo todo) {
    value.add(todo);
    notifyListeners();
  }
}
