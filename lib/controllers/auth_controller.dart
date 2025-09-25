import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_team_03_02/routes/routes.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordHidden = true.obs;

  void login() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username == "admin" && password == "admin") {
      isLoggedIn.value = true;
      Get.snackbar("Login Success", "Berhasil login sebagai $username");
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar("Login Failed", "Username / Password salah");
    }
  }

  void logout() {
    Get.defaultDialog(
      title: "Konfirmasi Logout",
      middleText: "Apakah kamu yakin ingin keluar?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: const Color.fromARGB(255, 26, 133, 255),
      onCancel: () {},
      onConfirm: () {
        Get.back(); 

        isLoggedIn.value = false;
        usernameController.clear();
        passwordController.clear();

        Get.snackbar(
          "Logout Success",
          "Anda sudah keluar",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromRGBO(76, 175, 80, 0.2),
          colorText: Colors.black,
          margin: const EdgeInsets.all(12),
          borderRadius: 8,
        );

        Get.offAllNamed(AppRoutes.login);
      },
      barrierDismissible: false,
    );
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
