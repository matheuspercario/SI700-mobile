import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return signInFormulario();
  }

  Widget signInFormulario() {
    final GlobalKey<FormState> formKey = new GlobalKey();
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
                onSaved: (String inValue) {},
                decoration: InputDecoration(
                    hintText: "none@none.com",
                    labelText: "Username (email address)")),
            TextFormField(
              initialValue: "",
              obscureText: true,
              validator: (String inValue) {
                if (inValue.length < 10) {
                  return "Password must be >=10 in length";
                }
                return null;
              },
              onSaved: (String inValue) {},
              decoration:
                  InputDecoration(hintText: "Password", labelText: "Password"),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Sign In"),
            )
          ],
        ),
      ),
    );
  }
}
