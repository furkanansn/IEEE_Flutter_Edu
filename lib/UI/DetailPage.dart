import 'package:flutter/material.dart';
import 'package:flutter_edu/definitions/Definitions.dart';
import 'package:flutter_edu/staticVar/HomeStatic.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeStatic detailObject = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: Definitions().otherAppBar(title: "Detail"),
      body: Card(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Image.network(detailObject.image), Text(detailObject.title,style: TextStyle(color: Colors.white),)],
        ),
      ),
    );
  }
}
