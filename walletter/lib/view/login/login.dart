import 'package:flutter/material.dart';
import 'package:walletter/model/login.dart';
import 'package:walletter/view/register/register.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final LoginData loginData = new LoginData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Spotify",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    usernameTextField(),
                    SizedBox(
                      height: 16,
                    ),
                    passwordTextField(),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    submitButton(),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Novo usuário?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignupPage();
                        }));
                      },
                      child: Text(
                        " Resgistre-se aqui!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent.shade700),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container submitButton() {
    return Container(
      height: 50,
      width: double.infinity,
      child: FlatButton(
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            loginData.doSomething();
          }
        },
        padding: EdgeInsets.all(0),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(29),
            color: Colors.greenAccent.shade700,
          ),
          child: Container(
            alignment: Alignment.center,
            constraints:
                BoxConstraints(maxWidth: double.infinity, minHeight: 50),
            child: Text(
              "Login",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      obscureText: true,
      validator: (String inValue) {
        if (inValue.length < 10) {
          return "Mínimo de 10 letras";
        }
        return null;
      },
      onSaved: (String inValue) {
        loginData.password = inValue;
      },
      decoration: InputDecoration(
        labelText: "Senha",
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
            )),
      ),
    );
  }

  TextFormField usernameTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String inValue) {
        if (inValue.length == 0) {
          return "Insira um nome de usuário";
        }
        return null;
      },
      onSaved: (String inValue) {
        loginData.username = inValue;
      },
      decoration: InputDecoration(
        labelText: "Usuário",
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
            )),
      ),
    );
  }
}
