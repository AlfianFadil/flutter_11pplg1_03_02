import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_team_03_02/controllers/add_todo_controller.dart';

class AddTodoPage extends StatelessWidget {
  final AddTodoController controller = Get.put(AddTodoController());

  AddTodoPage({super.key});

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
              "Tambah Todo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: TextField(
                        controller: controller.titleCtrl,
                        decoration: const InputDecoration(
                          labelText: "Judul",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: TextField(
                        controller: controller.descCtrl,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: "Deskripsi",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Obx(
                    () => DropdownButton<String>(
                      value: controller.selectedCategory.value,
                      items: controller.categories
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          controller.selectedCategory.value = value!,
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: controller.saveTodo,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Simpan"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
