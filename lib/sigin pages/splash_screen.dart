import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';


class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 5),(){

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context)=>DashBoardPage(),
          ));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        color:  Colors.blue.shade400,
        child: Center(
          child: Container(
            color:  Colors.blue.shade400,
            child: Image.asset('assets/images/jo.png'),
          ),
        ),
      ),
      // Text('Medics',style: TextStyle(fontSize: 35),),

    );
  }
}