import 'package:flutter/material.dart';
import 'package:flutter_project_apresentation/views/matheus_screen/mScreen_main.dart';
import 'package:flutter_project_apresentation/views/nicolli_screen/nScreen_main.dart';
import 'package:flutter_project_apresentation/views/project_screen/pScreen_main.dart';

class MyTabBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        //theme: ThemeData.dark().copyWith(primaryColor: Colors.green),
        home: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Projeto - Apresentação"),
              bottom: TabBar(
                // isScrollable: true, // tabs roláveis
                tabs: [
                  Tab(
                    child: Text("Matheus"),
                    icon: Icon(Icons.account_circle_outlined, size: 30),
                  ),
                  Tab(
                    text: "Nicolli",
                    icon: Icon(Icons.account_circle_outlined, size: 30),
                  ),
                  Tab(
                    icon: Icon(Icons.monetization_on_outlined, size: 30),
                    child: Text("Walletter"),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                MatheusScreen(),
                NicolliScreen(),
                ProjectScreen(),
              ],
            ),
          ),
        ));
  }
}
