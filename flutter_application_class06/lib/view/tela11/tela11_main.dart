import 'dart:io';

import 'package:flutter/material.dart';

class MainTela11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      generateButton(),
      generateAsyncButton(),
    ]);
  }

  int timeConsumingFunction() {
    sleep(Duration(seconds: 10));
    return 42;
  }

  Future<int> timeConsumingAsyncFunction() async {
    await Future.delayed(Duration(seconds: 10));
    return 42;
  }

  Widget generateButton() {
    return RaisedButton(
      child: Text("Click me Sync"),
      onPressed: () {
        var response = timeConsumingFunction();
        print("acabou $response");
      },
    );
  }

  Widget generateAsyncButton() {
    return RaisedButton(
      child: Text("Click me ASync"),
      onPressed: () {
        var response = timeConsumingAsyncFunction();
        response.then((respostaConcreta) {
          print(respostaConcreta);
        });
        print("acabou $response");
      },
    );
  }
}
