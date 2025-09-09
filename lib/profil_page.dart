import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar 1
            ClipOval(
              child: Image.asset(
                "assets/image/spongebob.jpg", // pastikan file ada di assets
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Nama untuk gambar 1
            const Text(
              "Aldikky Arfian Susanto(02)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 32),

            // Gambar 2
            ClipOval(
              child: Image.asset(
                "assets/image/spongebob.jpg", // pastikan file ada di assets
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Nama untuk gambar 2
            const Text(
              "Alfian Fadhil (03)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}