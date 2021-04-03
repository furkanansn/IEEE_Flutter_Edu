import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edu/definitions/Definitions.dart';
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Definitions().ourAppBar(),
      body: Center(
        child: Column(

          children: [
            Image.asset("assets/images/logo.png",width: MediaQuery.of(context).size.height / 3),
            Text("Welcome",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            SizedBox(height: MediaQuery.of(context).size.height / 5,),

            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: CupertinoButton(color: Colors.black,onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              child: Text("Login",style: TextStyle(color: Colors.white),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50,),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: CupertinoButton(color: Colors.grey,onPressed: () {
                Navigator.pushNamed(context, "/register");
              },
                  child: Text("Register",style: TextStyle(color: Colors.black),)),
            ),

          ],
        ),
      ),
    );
  }
}
