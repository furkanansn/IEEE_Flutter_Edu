import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLogic extends StatelessWidget {

  String id;

  Future<String> isLogged()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString("id");
    if(id == null){
      return "";
    }
    return id;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<String>(
        future: isLogged(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(id == null){
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamedAndRemoveUntil(context, "/landing", (route) => false);
              });

            }
            else{
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamedAndRemoveUntil(context, "/general", (route) => false);
              });

            }
          }

           return CupertinoActivityIndicator(radius: 30,);

        },
      )
    );
  }
}
