import 'package:flutter/material.dart';

class TransactionsListView extends StatefulWidget {
  TransactionsListView({Key key}) : super(key: key);

  @override
  _TransactionsStateListView createState() => _TransactionsStateListView();
}

class _TransactionsStateListView extends State<TransactionsListView> {
  final List icons = [
    Icons.remove_circle_outlined,
    Icons.add_circle_rounded,
  ];
  final List texto = [
    "Compra na padaria",
    "Pensão do meu pai",
    "Gasolina da moto",
    "Jogo da Steam",
    "Presente da minha avó",
    "Salário Estágio",
    "Sorvetes",
  ];

  final List colors = [
    Colors.redAccent.shade700,
    Colors.greenAccent.shade700,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: efficientlyGenerateListView(),
    );
  }

  Widget efficientlyGenerateListView() {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            child: ListTile(
              title: Text(
                texto[index % texto.length],
              ),
              leading: Icon(
                icons[index % icons.length],
                color: colors[index % colors.length],
              ),
            ),
          );
        });
  }
}
