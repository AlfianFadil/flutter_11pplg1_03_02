import 'package:flutter_team_03_02/add_todo_page.dart';
import 'package:flutter_team_03_02/bindings/auth_binding.dart';
import 'package:flutter_team_03_02/bindings/home_binding.dart';
import 'package:flutter_team_03_02/dashboard_page.dart';
import 'package:flutter_team_03_02/login_page.dart';
import 'package:flutter_team_03_02/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    // Login Page
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),

    // Dashboard (BottomNav: Home, History, Profile)
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      binding: HomeBinding(),
    ),

    // Add Todo
    GetPage(
      name: AppRoutes.addTodo,
      page: () => AddTodoPage(),
      binding: HomeBinding(),
    ),
  ];
}