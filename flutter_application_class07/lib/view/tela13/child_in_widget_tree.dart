import 'package:flutter_application_class07/view/tela13/inherited_example.dart';
import 'package:flutter/material.dart';

class ChildInWidgetTree extends StatefulWidget {
  @override
  _ChildInWidgetTreeState createState() => _ChildInWidgetTreeState();
}

class _ChildInWidgetTreeState extends State<ChildInWidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      width: double.infinity,
      child: Column(
        children: [
          generateStreamBuilder(),
          Text(
              "Veio do Pai: ${InheritedExample.of(context).intWrapper.numeroQualqer}"),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text("Botão no Filho"))
        ],
      ),
    );
  }

  Widget generateStreamBuilder() {
    return StreamBuilder(
      stream: InheritedExample.of(context).stream.map((input) {
        return "Recebi: $input";
      }),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Text("Conectado");
        } else if (snapshot.hasError) {
          return Icon(Icons.error_outline);
        } else {
          return Text("--> ${snapshot.data}");
        }
      },
    );
  }
}
