import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matheus App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MatheusHomePage(),
    );
  }
}

class MatheusHomePage extends StatelessWidget {
  List thorHammer(List thor, List hammer) {
    var x_thor = thor[0];
    var y_thor = thor[1];
    var x_mart = hammer[0];
    var y_mart = hammer[1];
    var positions = [thor];

    while (true) {
      // Descobrir o lado do passo
      if (x_mart > x_thor) {
        x_thor++;
      } else {
        if (x_mart < x_thor) {
          x_thor--;
        } else {
          if (y_mart > y_thor) {
            y_thor++;
          } else {
            if (y_mart < y_thor) {
              y_thor--;
            }
          }
        }
      }

      // Adicionar ao percurso
      positions.add([x_thor, y_thor]);

      // Verificar se o THOR e o martelo estão juntos
      if (positions.last.toString() == hammer.toString()) {
        break;
      }
    }

    return positions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thor Hammer"),
      ),
      body: Center(
        child: FittedBox(
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: retornaRows(thorHammer([1, 1], [3, 2]))),
          ),
        ),
      ),
    );
  }
}

List<Widget> retornaRows(List positions) {
  List<Widget> rows = [];
  for (int j = 0; j < 5; j++) {
    rows.add(Column(children: retornaContainers(j, positions)));
  }
  return rows;
}

List<Widget> retornaContainers(j, positions) {
  List<Widget> column = [];

  for (int i = 0; i < 5; i++) {
    String atual = "[${j + 1}, ${i + 1}]";
    if (positions.toString().contains(atual)) {
      column.add(containerGreen());
    } else {
      column.add(containerGrey()); // ? containerGrey() : containerGrey()
    }
  }
  return column;
}

Widget containerGrey() {
  return Container(
    height: 105,
    width: 60,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(5)),
  );
}

Widget containerGreen() {
  return Container(
    height: 105,
    width: 60,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: Colors.lightGreen, borderRadius: BorderRadius.circular(5)),
  );
}
