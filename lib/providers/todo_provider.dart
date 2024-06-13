import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:uuid/uuid.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  final uuid = Uuid();

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    _todos.add(Todo(
      id: uuid.v4(),
      title: title,
    ));
    notifyListeners();
  }

  void toggleTodoStatus(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].isCompleted = !_todos[index].isCompleted;
      notifyListeners();
    }
  }

  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
