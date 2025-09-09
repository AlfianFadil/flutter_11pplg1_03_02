import 'package:get/get.dart';
import '../models/todo_model.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var history = <Todo>[].obs;

  void addTodo(String title, String description, String category) {
    todos.add(Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      category: category,
      createdAt: DateTime.now(),
    ));
  }

  void removeTodoAt(int index) {
    if (index >= 0 && index < todos.length) {
      todos.removeAt(index);
    }
  }

  void removeHistoryAt(int index) {
    if (index >= 0 && index < history.length) {
      history.removeAt(index);
    }
  }

  void markAsDone(int index) {
    if (index >= 0 && index < todos.length) {
      final todo = todos[index].copyWith(
        isDone: true,
        completedAt: DateTime.now(),
      );
      history.add(todo);
      todos.removeAt(index);
    }
  }
}
