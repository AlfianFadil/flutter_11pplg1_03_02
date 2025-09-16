import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_team_03_02/routes/routes.dart';

class ProfilPage extends StatelessWidget {
  void _showLogoutDialog() {
    Get.defaultDialog(
      title: "Konfirmasi Logout",
      middleText: "Apakah kamu yakin ingin keluar?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: const Color.fromARGB(255, 26, 133, 255),
      onCancel: () {},
      onConfirm: () {
        Get.back();

        // ✅ Snackbar sukses logout
        Get.snackbar(
          "Logout Berhasil",
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

  Widget buildProfileCard(String imagePath, String name) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Hilangkan AppBar default → kita ganti dengan header custom
      body: Column(
        children: [
          // 🔹 Header block warna di atas
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Center(
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),

          // 🔹 Isi daftar profil
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                buildProfileCard("assets/image/giga.jpg", "Aldikky Arfian Susanto (02)"),
                buildProfileCard("assets/image/profil.jpg", "Alfian Fadhil (03)"),
              ],
            ),
          ),
        ],
      ),

      // Tombol logout di pojok kanan bawah
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: _showLogoutDialog,
        child: const Icon(Icons.logout, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
