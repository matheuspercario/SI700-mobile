import 'package:flutter/material.dart';

class AddIncome extends StatefulWidget {
  AddIncome({Key key}) : super(key: key);

  @override
  _AddIncomeState createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nova Receita',
        ),
        backgroundColor: Colors.greenAccent.shade700,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Tela: nova receita")],
        ),
      ),
    );
  }
}
