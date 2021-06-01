import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_database/logic/manage_auth/auth_bloc.dart';
import 'package:flutter_database/logic/manage_auth/auth_event.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return registerFormulario();
  }

  Widget registerFormulario() {
    final GlobalKey<FormState> formKey = new GlobalKey();
    final RegisterUser registerData = new RegisterUser();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: "",
              keyboardType: TextInputType.emailAddress,
              validator: (String inValue) {
                if (inValue.length == 0) {
                  return "Please enter username";
                }
                return null;
              },
              onSaved: (String inValue) {
                registerData.username = inValue;
              },
              decoration: InputDecoration(
                  hintText: "none@none.com",
                  labelText: "Username (email address)"),
            ),
            TextFormField(
              initialValue: "",
              obscureText: true,
              validator: (String inValue) {
                if (inValue.length < 1) {
                  return "Password must be >=1 in length";
                }
                return null;
              },
              onSaved: (String inValue) {
                registerData.password = inValue;
              },
              decoration:
                  InputDecoration(hintText: "Password", labelText: "Password"),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  BlocProvider.of<AuthBloc>(context).add(registerData);
                }
              },
              child: Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
