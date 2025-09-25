import 'package:flutter_team_03_02/history_page.dart';
import 'package:flutter_team_03_02/home_page.dart';
import 'package:flutter_team_03_02/profil_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class HomeController extends GetxController {
  // Index tab saat ini
  final RxInt currentIndex = 0.obs;

  // Halaman-halaman (UI)
  final pages = <Widget>[
    HomePage(),
    HistoryPage(),
    ProfilPage(),
  ];

  // Item bottom navigation
  final navItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];

  // Fungsi untuk ganti halaman
  void changePage(int index) {
    currentIndex.value = index;
  }
}
