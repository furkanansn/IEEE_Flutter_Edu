import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email;
  String username;
  String phone;
  String password;
  SharedPreferences sharedPreferences;

  String newEmail;
  String newUsername;
  String newPhone;
  String newPassword;

  Future getUser()async{
    sharedPreferences  = await SharedPreferences.getInstance();
    email = sharedPreferences.getString("email");
    username = sharedPreferences.getString("username");
    phone = sharedPreferences.getString("phone");
    password = sharedPreferences.getString("password");
  }

  final _key = GlobalKey<FormState>();

  bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: getUser(),builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
        return Form(
          key: _key,
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: [
                    Image.network("https://static.wixstatic.com/media/2cd43b_b13c89d3859a48129a434265b3ddd1a1~mv2_d_1826_1920_s_2.png",width: MediaQuery.of(context).size.width / 2,),


                    Padding(padding: EdgeInsets.all(16.0),
                      child: TextFormField(
                        initialValue: email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value.isEmpty){
                            return "Please enter a email";
                          }
                        },
                        onSaved: (newValue) {
                          newEmail = newValue;
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
                        initialValue: phone,
                        maxLength: 11,
                        maxLengthEnforced: true,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value.isEmpty){
                            return "Please enter a phone number";
                          }
                        },
                        onSaved: (newValue) {
                          newPhone = newValue;
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
                          newPassword = newValue;
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

                                }),
                            labelText: "Password",
                            hintText: "Password"),
                      ),
                    ),
                    CupertinoButton.filled(child: Text("Save"), onPressed: (){
                      save();
                    })
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return CupertinoActivityIndicator(radius: 30,);
    },);
  }

  save(){

    FormState formState = _key.currentState;
    if(formState.validate()){
      formState.save();
      sharedPreferences.setString("email", newEmail);
      sharedPreferences.setString("password", newPassword);
      sharedPreferences.setString("phone", newPhone);
      log("saved");
    }





  }
}
