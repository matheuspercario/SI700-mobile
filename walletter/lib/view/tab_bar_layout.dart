import 'package:flutter/material.dart';
import 'package:walletter/view/tela01/tela01_main.dart';
import 'package:walletter/view/tela02/tela02_main.dart';
import 'package:walletter/view/tela03/tela03_main.dart';

class MyTabBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabBar Layout"),
          bottom: TabBar(
            isScrollable: true, // tabs roláveis
            tabs: [
              Tab(
                child: Text("Primeira Tela"),
                icon: Icon(Icons.access_alarm),
              ),
              Tab(
                text: "Segunda Tela",
                icon: Icon(Icons.account_box),
              ),
              Tab(
                icon: Icon(Icons.cake),
                child: Text("Terceira Tela"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MainTela1(),
            MainTela2(),
            MainTela3(),
          ],
        ),
      ),
    );
  }
}
