import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_team_03_02/controllers/todo_controller.dart';
import 'package:flutter_team_03_02/widgets/todo_card.dart';

class HistoryPage extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();

  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History")),
      body: Obx(() {
        if (todoController.history.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada todo yang selesai.",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: todoController.history.length,
          itemBuilder: (context, index) {
            final todo = todoController.history[index];
            return TodoCard(
              todo: todo,
              onDelete: () => todoController.removeHistoryAt(index),
            );
          },
        );
      }),
    );
  }
}