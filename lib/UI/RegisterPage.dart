import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edu/definitions/Definitions.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _key = GlobalKey<FormState>();
  String _email;
  String _password;
  String _passwordAgain;
  String _id;
  String _phone;
  String _userName;
  bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Definitions().ourAppBar(),
      backgroundColor: Colors.white,
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png",width: MediaQuery.of(context).size.width / 3,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onSaved: (newValue) {
                    _userName = newValue;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Username lenght must be at least 4  ";
                    }
                  },
                  keyboardType: TextInputType.text,

                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                      labelText: "Username",
                      hintText: "Username"),
                ),
              ),
              
              Padding(padding: EdgeInsets.all(16.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value.isEmpty){
                    return "Please enter a email";
                  }
                },
                onSaved: (newValue) {
                  this._email = newValue;
                },
                decoration: InputDecoration(
                  labelText: "E-mail",
                  hintText: "E-mail",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
                ),
              ),
              ),
              Padding(padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  maxLength: 11,
                  maxLengthEnforced: true,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Please enter a phone number";
                    }
                  },
                  onSaved: (newValue) {
                    this._phone = newValue;
                  },
                  decoration: InputDecoration(
                      labelText: "Phone",
                      hintText: "Phone",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
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
                            });
                          }),
                      labelText: "Password",
                      hintText: "Password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onSaved: (newValue) {
                    _passwordAgain = newValue;
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
                            });
                          }),
                      labelText: "Password again",
                      hintText: "Password again"),
                ),
              ),
              CupertinoButton.filled(child: Text("Register"), onPressed: (){
                register(context);

              })
            ],
          ),
        ),
      ),
    );
  }

  register(context) async{
    FormState formState = _key.currentState;
    if(formState.validate()){

      formState.save();
      if(_password == _passwordAgain){
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("username", _userName);
        sharedPreferences.setString("email", _email);
        sharedPreferences.setString("phone", _phone);
        sharedPreferences.setString("password", _password);
        sharedPreferences.setString("id", "0");
        Navigator.pushNamedAndRemoveUntil(context, "/logic", (route) => false);
      }
      else{
        showDialog(context: context, builder: (context) {
          return CupertinoAlertDialog(
            content: Text("Check password"),
            actions: [CupertinoButton.filled(child: Text("Ok"), onPressed: (){
              Navigator.pop(context);
            })],
          );
        },);
      }


    }
  }
}
