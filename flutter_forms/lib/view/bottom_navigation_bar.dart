import 'package:flutter/material.dart';
import 'package:flutter_forms/view/tela01/tela01_main.dart';
import 'package:flutter_forms/view/tela02/tela02_main.dart';
import 'package:flutter_forms/view/tela03/tela03_main.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyBottomNavigationBarState();
  }
}

class MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentPage = 0;
  List<Widget> _pages = [
    MainTela1(),
    MainTela2(),
    MainTela3(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Scaffold(
        appBar: AppBar(title: Text("BottomNavigationBar Layout")),
        body: _pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_tree_rounded), label: "Tela 01"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo), label: "Tela 02"),
            BottomNavigationBarItem(
                icon: Icon(Icons.zoom_in_sharp), label: "Tela 03"),
          ],
          currentIndex: _currentPage,
          // fixedColor: Colors.blueGrey, // Cor fixa (sem combinar com materialApp)
          onTap: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}
