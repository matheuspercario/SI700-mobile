import 'package:flutter_application_class07/view/tela13/IntWrapper.dart';
import 'package:flutter/material.dart';

class InheritedExample extends InheritedWidget {
  final IntWrapper intWrapper;
  final Stream<int> stream;

  InheritedExample({this.stream, this.intWrapper, Widget child})
      : super(child: child);

  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static InheritedExample of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedExample>();
  }
}
