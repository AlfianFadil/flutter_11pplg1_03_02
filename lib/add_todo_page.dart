import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_team_03_02/controllers/todo_controller.dart';

class AddTodoPage extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();

  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final categories = ["School", "Work", "Private"];
  final RxString selectedCategory = "School".obs;

  AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🔹 Block warna untuk judul halaman
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

          // 🔹 Isi utama
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // 🔹 Card untuk Judul
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: TextField(
                        controller: titleCtrl,
                        decoration:
                            const InputDecoration(labelText: "Judul", border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // 🔹 Card untuk Deskripsi
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: TextField(
                        controller: descCtrl,
                        maxLines: 3,
                        decoration:
                            const InputDecoration(labelText: "Deskripsi", border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // 🔹 Dropdown kategori
                  Obx(
                    () => DropdownButton<String>(
                      value: selectedCategory.value,
                      items: categories
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) => selectedCategory.value = value!,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🔹 Tombol Simpan
                  ElevatedButton(
                    onPressed: () {
                      todoController.addTodo(
                        titleCtrl.text,
                        descCtrl.text,
                        selectedCategory.value,
                      );
                      Get.back();
                    },
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
