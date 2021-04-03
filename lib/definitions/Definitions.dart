import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edu/UI/GeneralWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Definitions {
  Widget ourAppBar({String title}) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Image.asset("assets/images/logo.png",width: 50,height: 50,),
      centerTitle: true,
    );
  }

  Widget otherAppBar({String title}) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(title),
      centerTitle: true,
    );
  }

  Widget myDrawer(context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text("HEADER",style: textStyle(),),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GeneralWidget(0),)),//Navigator.pushNamed(context, "/general",arguments: "0"),
                child: ListTile(
                  leading: Icon(Icons.home,color: Colors.white,),
                  title: Text("Home",style: textStyle(),),
                  trailing: Icon(Icons.arrow_right,color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GeneralWidget(1),)),//Navigator.pushNamed(context, "/general",arguments: "0"),
                child: ListTile(
                  leading: Icon(Icons.dialpad_sharp,color: Colors.white,),
                  title: Text("Discover",style: textStyle(),),
                  trailing: Icon(Icons.arrow_right,color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GeneralWidget(2),)),//Navigator.pushNamed(context, "/general",arguments: "0"),
                child: ListTile(
                  leading: Icon(Icons.home,color: Colors.white,),
                  title: Text("Profile",style: textStyle(),),
                  trailing: Icon(Icons.arrow_right,color: Colors.white),
                ),
              ),
              Spacer(),
              CupertinoButton(color: Colors.white,child: Text("Log Out",style: TextStyle(color: Colors.black),), onPressed: ()async{
               SharedPreferences shared = await SharedPreferences.getInstance();
               shared.remove("id");
                Navigator.pushNamedAndRemoveUntil(context, "/logic", (route) => false);
              })
            ],
          ),
        ),
      ),
    );
  }

  textStyle(){
    return TextStyle(
      color: Colors.white
    );
  }


}
