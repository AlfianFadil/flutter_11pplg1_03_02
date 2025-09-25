import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_team_03_02/controllers/home_controller.dart';

class DashboardPage extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: homeController.pages[homeController.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: homeController.currentIndex.value,
            onTap: homeController.changePage,
            items: homeController.navItems,
          ),
        ));
  }
}
