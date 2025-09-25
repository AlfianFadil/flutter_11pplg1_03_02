import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'todo_controller.dart';

class AddTodoController extends GetxController {
  final TodoController todoController = Get.find<TodoController>();

  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();

  final categories = ["School", "Work", "Private"];
  final RxString selectedCategory = "School".obs;

  void saveTodo() {
    if (titleCtrl.text.isNotEmpty && descCtrl.text.isNotEmpty) {
      todoController.addTodo(
        titleCtrl.text,
        descCtrl.text,
        selectedCategory.value,
      );
      Get.back();
    } else {
      Get.snackbar("Error", "Judul dan Deskripsi tidak boleh kosong");
    }
  }

  @override
  void onClose() {
    titleCtrl.dispose();
    descCtrl.dispose();
    super.onClose();
  }
}
