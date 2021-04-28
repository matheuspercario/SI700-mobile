import 'dart:async';
import 'dart:math';

import 'package:flutter_application_class07/view/tela13/IntWrapper.dart';
import 'package:flutter_application_class07/view/tela13/child_in_widget_tree.dart';
import 'package:flutter_application_class07/view/tela13/inherited_example.dart';
import 'package:flutter/material.dart';

class MainTela13 extends StatelessWidget {
  final IntWrapper intWrapper = IntWrapper(numeroQualqer: 42);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        generateListenButton(context),
        generateGeneratorListenButton(context),
        generateBroadcastButton(context),
        generateFilteredMappedButton(context),
        generateStreamLoopButton(context),
        generateStreamBuilder(),
        Divider(),
        generateParentChildRelationship(context),
      ],
    );
  }

  Widget generateListenButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();
          Stream<int> numberStream = numberStreamCreator.stream;

          await Future.delayed(Duration(seconds: 10));

          numberStream.listen((event) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received: $event"));
          });
          // Linha abaixo vai dar um erro.
          //numberStream.listen((event) {});
        },
        child: Text("Listen Stream"));
  }

  Widget generateGeneratorListenButton(context) {
    return ElevatedButton(
        onPressed: () async {
          Stream<int> numberStream = enviaDados();

          //await Future.delayed(Duration(seconds: 10));

          numberStream.listen((event) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received: $event"));
          });
          // Linha abaixo vai dar um erro.
          //numberStream.listen((event) {});
        },
        child: Text("Listen Stream Generator"));
  }

  Widget generateBroadcastButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();
          Stream<int> numberStream =
              numberStreamCreator.stream.asBroadcastStream();

          numberStream.listen((event) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received1: $event"));
          });
          await Future.delayed(Duration(seconds: 10));

          // Linha abaixo vai dar um erro.
          numberStream.listen((event) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received2: $event"));
          });
        },
        child: Text("Listen Stream Broadcast"));
  }

  Widget generateFilteredMappedButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();
          Stream<int> numberStream = numberStreamCreator.stream;

          Stream<int> filteredStream = numberStream.where((input) {
            return input % 2 == 0;
          });

          Stream<String> mappedStream = filteredStream.map((input) {
            return "$input ao quadrado é ${input * input}";
          });

          mappedStream.listen((event) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received: $event"));
          });
          // Linha abaixo vai dar um erro.
          //numberStream.listen((event) {});
        },
        child: Text("Listen Map and Filter Stream"));
  }

  Widget generateStreamLoopButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();
          Stream<int> numberStream = numberStreamCreator.stream;

          int total = 0;

          await for (int value in numberStream) {
            total += value;
            ScaffoldMessenger.of(context).showSnackBar(
                generateSnackBar("Received: $value --> Total: $total"));
          }
        },
        child: Text("Loop Through Stream"));
  }

  Widget generateStreamBuilder() {
    return StreamBuilder(
      stream: NumberStreamCreator().stream.map((input) {
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

  Widget generateSnackBar(String text) {
    return SnackBar(
      content: Text(text),
      duration: Duration(
        seconds: 1,
      ),
    );
  }

  generateParentChildRelationship(context) {
    return Column(
      children: [
        InheritedExample(
            intWrapper: intWrapper,
            stream: NumberStreamCreator().stream.asBroadcastStream(),
            child: ChildInWidgetTree()),
        Divider(),
        ElevatedButton(
            onPressed: () {
              intWrapper.numeroQualqer += 10;
              ScaffoldMessenger.of(context).showSnackBar(
                  generateSnackBar("${intWrapper.numeroQualqer}"));
            },
            child: Text("Botão no Pai"))
      ],
    );
  }
}

class NumberStreamCreator {
  int _count = 1;
  final StreamController<int> _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  NumberStreamCreator() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      _controller.sink.add(_count);
      _count++;

      if (_count > 10) {
        timer.cancel();
        _controller.close();
      }
    });
  }
}

Stream<int> enviaDados() async* {
  var rng = new Random();
  for (int i = 1; i <= 10; i++) {
    var seconds = rng.nextInt(10);
    await Future.delayed(Duration(seconds: seconds));
    yield i;
  }
}
