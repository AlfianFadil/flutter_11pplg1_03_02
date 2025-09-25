import 'package:flutter/material.dart';
import 'package:flutter_team_03_02/routes/pages.dart';
import 'package:flutter_team_03_02/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'flutter_team_03_02',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         useMaterial3: true,
      ),
           initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
    );
  }
}