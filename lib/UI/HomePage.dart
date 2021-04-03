import 'package:flutter/material.dart';
import 'package:flutter_edu/definitions/Definitions.dart';
import 'package:flutter_edu/staticVar/HomeStatic.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeStatic> homeStaticList = new List();

  @override
  void initState() {
    generateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: ListView.builder(
        itemCount: homeStaticList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Image.network(
                    homeStaticList[index].image,
                    width: MediaQuery.of(context).size.width / 10,
                    height: MediaQuery.of(context).size.width / 10,
                  ),
                  Text(homeStaticList[index].title,style: TextStyle(color: Colors.white),),
                  Spacer(),
                  Icon(Icons.arrow_drop_down_sharp,color: Colors.white,)
                ],
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/detail",arguments: homeStaticList[index]);
                },
                child: Container(
                  color: Colors.white,
                  child: Image.network(
                    homeStaticList[index].image,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,

                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_drop_down_sharp,color: Colors.white,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_drop_down_sharp,color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_drop_down_sharp,color: Colors.white),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_drop_down_sharp,color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(homeStaticList[index].title,style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(homeStaticList[index].title,style: TextStyle(color: Colors.white)),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
/*
ListTile(
              title: Text(homeStaticList[index].title),
              leading: Image.network(homeStaticList[index].image),
              trailing: Icon(Icons.arrow_right),
            )
 */

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
