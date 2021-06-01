import 'package:flutter/material.dart';
import 'package:flutter_database/view/auth/register.dart';
import 'package:flutter_database/view/auth/sign_in.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthenticationScreenState();
  }
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: [
              SignIn(),
              Register(),
            ],
          ),
          appBar: AppBar(
            title: Text("Configuração de Usuários"),
            bottom: TabBar(
              tabs: [Tab(text: "Efetuar Login"), Tab(text: "Novo Registro")],
            ),
          ),
        ));
  }
}
