import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_team_03_02/controllers/todo_controller.dart';
import 'package:flutter_team_03_02/widgets/todo_card.dart';
import 'package:flutter_team_03_02/routes/routes.dart';

class HomePage extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.blueAccent,
            child: const Text(
              "Home",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          Expanded(
            child: SafeArea(
              child: Obx(() {
                if (todoController.todos.isEmpty) {
                  return const Center(
                    child: Text(
                      "Belum ada todo.\nTambahkan todo baru dengan tombol +",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: todoController.todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoController.todos[index];
                    return TodoCard(
                      todo: todo,
                      onDone: () => todoController.markAsDone(index),
                      onDelete: () => todoController.removeTodoAt(index),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addTodo),
        child: const Icon(Icons.add),
      ),
    );
  }
}
