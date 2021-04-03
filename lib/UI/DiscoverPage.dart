import 'package:flutter/material.dart';
import 'package:flutter_edu/UI/HomePage.dart';
import 'package:flutter_edu/staticVar/HomeStatic.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<HomeStatic> homeStaticList = new List();
  SliverGridDelegate sliverGridDelegate;
  @override
  void initState() {
    generateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: homeStaticList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Column(
                children: [
                  Expanded(child: Image.network(homeStaticList[index].image))
                ],
              ),
            ),
          );
        },
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }

  generateList() {
    for (int i = 0; i < 60; i++) {
      HomeStatic homeStatic = new HomeStatic();

      homeStatic.image =
          "https://static.wixstatic.com/media/2cd43b_b13c89d3859a48129a434265b3ddd1a1~mv2_d_1826_1920_s_2.png";
      homeStatic.title = i.toString() + "asd";

      homeStaticList.add(homeStatic);
    }
  }
}
