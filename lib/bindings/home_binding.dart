import 'package:get/get.dart';
import 'package:flutter_team_03_02/controllers/home_controller.dart';
import 'package:flutter_team_03_02/controllers/todo_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TodoController>(() => TodoController());
  }
}