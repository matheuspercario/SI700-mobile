import 'package:flutter/material.dart';
import 'package:walletter/model/complete_form.dart';

class MainTela4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainTela4State();
  }
}

class MainTela4State extends State<MainTela4> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  CompleteForm completeForm = new CompleteForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [myCheckbox()],
        ),
      ),
    );
  }

  Widget myCheckbox() {
    return Checkbox(
      value: completeForm.checkBoxValue,
      onChanged: (bool value) {
        setState(() {
          completeForm.checkBoxValue = value;
        });
      },
    );
  }
}
