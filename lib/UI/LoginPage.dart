import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edu/UI/HomePage.dart';
import 'package:flutter_edu/definitions/Definitions.dart';
import 'package:flutter_edu/staticVar/LoginStatic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();

  String _email;

  String _password;

  LoginStatic _loginStatic;

  bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Definitions().ourAppBar(title: "Login"),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FlutterLogo(
                    size: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    onSaved: (newValue) {
                      _email = newValue;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "E-mail Adress", labelText: "E-mail Adress",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        )      
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      _password = newValue;
                    },
                    validator: (value) {
                      if (value.length < 6) {
                        return "Password lenght must be at least 6";
                      }
                    },
                    keyboardType: TextInputType.text,
                    obscureText: _hideText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                        suffixIcon: IconButton(
                            icon:
                            _hideText ?
                            Icon(Icons.visibility)
                            :
                            Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _hideText = !_hideText;
                                log(_hideText.toString());
                              });
                            }),
                        labelText: "Password",
                        hintText: "Password"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoButton.filled(
                      child: Text("Login"),
                      onPressed: () {
                        FormState _state = _key.currentState;
                        if (_state.validate()) {
                          _state.save();
                          log(_email);
                          log(_password);
                          login(
                              email: _email,
                              password: _password,
                              context: context);
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  login({String email, String password, context}) async{
    _loginStatic = new LoginStatic();

    _loginStatic.email = "flutter@gmail.com";
    _loginStatic.password = "12345678";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      log(sharedPreferences.getString("email"));
    log(sharedPreferences.getString("password"));
    if (email == sharedPreferences.getString("email") && password == sharedPreferences.getString("password")) {


      sharedPreferences.setString("id", "1");

      Navigator.pushNamedAndRemoveUntil(context, "/general", (route) => false);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Uyarı!"),
            content: Text("Yanlış Email ya da parola girdiniz."),
            actions: [
              CupertinoButton.filled(
                child: Text("Tamam"),
                onPressed: () {
                 Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }
  }
}
