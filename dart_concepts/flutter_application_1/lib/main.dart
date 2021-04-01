import 'package:flutter/material.dart';

void main() {
  // runApp(MaterialApp(home: MatheusHomePage()));
  runApp(MyApp());
}

class MatheusHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matheus Título"),
      ),
      body: Container(
        child: Container(
          color: Colors.green,
          child: Center(child: Text("Matheus Percário Bruder")),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the ROOT of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Construtor
  MyHomePage({Key? key, this.title}) : super(key: key);
  // Atributo
  final String? title;
  // CreateState
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Olá este é um teste! hahahaha"),
            Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text("Matheus Percário Bruder"),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: FloatingActionButton(
              //onPressed: _incrementCounter,
              onPressed: () {
                setState(() {
                  _counter--;
                });
              },
              tooltip: 'Increment',
              child: Icon(Icons.remove),
            ),
          ),
          FloatingActionButton(
            //onPressed: _incrementCounter,
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
