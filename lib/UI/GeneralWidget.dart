import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edu/UI/DiscoverPage.dart';
import 'package:flutter_edu/UI/HomePage.dart';
import 'package:flutter_edu/UI/ProfilePage.dart';
import 'package:flutter_edu/definitions/Definitions.dart';

class GeneralWidget extends StatefulWidget {
  int index;
  GeneralWidget(int i){
    this.index = i;
  }

  @override
  _GeneralWidgetState createState() => _GeneralWidgetState(index);
}

class _GeneralWidgetState extends State<GeneralWidget> {

  List<Widget> _tabWidgets = [
    HomePage(),
    DiscoverPage(),
    ProfilePage()
  ];

  int currentIndex =  0;

  _GeneralWidgetState(int index){
    currentIndex = index;
  }

  _onTapChange(int index){
    setState(() {
      this.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Definitions().myDrawer(context),
      backgroundColor: Colors.black,
      appBar: Definitions().ourAppBar(title: "My App"),
      body: _tabWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 1,
        iconSize: 25,
        onTap: (value) {
          return _onTapChange(value);
        },
        items: [
          BottomNavigationBarItem(backgroundColor: Colors.black,icon: Icon(Icons.home), title: Text("")),
          BottomNavigationBarItem(backgroundColor: Colors.black,icon: Icon(Icons.dialpad_sharp), title: Text("")),
          BottomNavigationBarItem(backgroundColor: Colors.black,icon: Icon(CupertinoIcons.profile_circled), title: Text("")),
        ],
      ),
    );
  }
}
