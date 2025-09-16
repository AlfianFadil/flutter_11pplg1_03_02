import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_team_03_02/widgets/widget_button.dart';
import 'package:flutter_team_03_02/widgets/widget_textfield.dart';
import 'package:flutter_team_03_02/routes/routes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  String statusLogin = "login status";

  bool isPasswordHidden = true; //  untuk toggle hide/show

  void _showConfirmDialog() {
    Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Masuk sebagai \"${controllerUsername.text}\"?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: const Color.fromARGB(255, 26, 133, 255),
      onCancel: () {}, // jika No ditekan
      onConfirm: () {
        Get.back(); // tutup dialog

        // ✅ Snackbar berhasil login
        Get.snackbar(
          "Login Success",
          "Berhasil login sebagai ${controllerUsername.text}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor:const Color.fromRGBO(76, 175, 80, 0.2), 
          duration: const Duration(seconds: 2), // hilang otomatis 2 detik
        );

        Get.offAllNamed(AppRoutes.dashboard); // lanjut ke dashboard
      },
      barrierDismissible: false, // tidak bisa klik luar dialog
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🔹 Block warna hijau di atas
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            color: Colors.lightBlue[700],
            child: const Center(
              child: Text(
                "Login Page",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // 🔹 Isi body
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Welcome to my todolist-app",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 1, 225, 255),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Please login using your username and password",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),

                        // Image
                        Image.asset(
                          'assets/image/login.png',
                          width: 100,
                          height: 100,
                        ),

                        const SizedBox(height: 25),

                        // Username input
                        MyTextField(
                          textEditingController: controllerUsername,
                          labelText: "Username",
                        ),

                        const SizedBox(height: 25),

                        // Password input dengan show/hide
                        TextField(
                          controller: controllerPassword,
                          obscureText: isPasswordHidden,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordHidden = !isPasswordHidden;
                                });
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Button Login
                        CustomButton(
                          text: "Login",
                          onPressed: () {
                            if (controllerUsername.text == "admin" &&
                                controllerPassword.text == "admin") {
                              // ✅ Tampilkan konfirmasi pakai GetX
                              _showConfirmDialog();
                            } else {
                              Get.snackbar(
                                "Login Failed",
                                "Username / Password salah",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: const Color.fromRGBO(
                                    244, 67, 54, 0.2), // merah 20%
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
