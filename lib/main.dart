import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:async';
import 'my_flutter_app_icons.dart';

void main() => runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(
        seconds: 3
    ), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),),);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 50.0,
                        child: Icon(
                          MyFlutterApp.wolframlanguage,
                          color: Colors.greenAccent,
                          size: 70.0,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10.0,)
                      ),
                      Text(
                          "Skoll Browser",style:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 20),
                    ),
                    Text("Loading to browser",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                  ],
                )
                ,)
            ],
          )
        ],
      ),
    );
  }
}