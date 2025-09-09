import 'package:flutter/material.dart';
import 'package:flutter_team_03_02/routes/pages.dart';
import 'package:flutter_team_03_02/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         useMaterial3: true,
      ),
           initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
    );
  }
}