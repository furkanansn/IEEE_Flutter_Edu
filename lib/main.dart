import 'package:flutter/material.dart';
import 'package:flutter_edu/UI/AppLogic.dart';
import 'package:flutter_edu/UI/DetailPage.dart';
import 'package:flutter_edu/UI/DiscoverPage.dart';
import 'package:flutter_edu/UI/GeneralWidget.dart';
import 'package:flutter_edu/UI/HomePage.dart';
import 'package:flutter_edu/UI/LandingPage.dart';
import 'package:flutter_edu/UI/LoginPage.dart';
import 'package:flutter_edu/UI/ProfilePage.dart';
import 'package:flutter_edu/UI/RegisterPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/logic",
      routes: {
        "/" : (context) => LoginPage(),
        "/home" : (context) => HomePage(),
        "/detail": (context) => DetailPage(),
        "/general" : (context) => GeneralWidget(0),
        "/discover" : (context) => DiscoverPage(),
        "/logic" : (context) => AppLogic(),
        "/register" : (context) => RegisterPage(),
        "/landing" : (context) => LandingPage(),
        "/profile" : (context) => ProfilePage()
      },
    );
  }
}


