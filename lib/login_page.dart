import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_team_03_02/controllers/auth_controller.dart';
import 'package:flutter_team_03_02/widgets/widget_button.dart';
import 'package:flutter_team_03_02/widgets/widget_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/login.png", 
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 16),

              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please login to continue",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 40),

              MyTextField(
                textEditingController: controller.usernameController,
                labelText: "Username",
              ),
              const SizedBox(height: 20),

              Obx(() => TextField(
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () => controller.isPasswordHidden.value =
                            !controller.isPasswordHidden.value,
                      ),
                    ),
                  )),
              const SizedBox(height: 30),

              CustomButton(
                text: "Login",
                onPressed: () => controller.login(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
