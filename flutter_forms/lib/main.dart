import 'package:flutter/material.dart';
import 'package:flutter_forms/view/tab_bar_layout.dart';
import 'package:flutter_forms/view/bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyTabBarLayout(); // Gerenciador de Estados Automático
    // return MyBottomNavigationBar(); // Com Gerenciador de Estados Próprio
  }
}
