import 'package:different_views/view/bottom_navigation_bar.dart';
import 'package:different_views/view/tab_bar_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MyTabBarLayout(); // Gerenciador de Estados Automático
    return MyBottomNavigationBar(); // Com Gerenciador de Estados Próprio
  }
}
