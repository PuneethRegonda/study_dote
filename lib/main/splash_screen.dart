import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:study_dote/registration/first_screen.dart';
import 'package:study_dote/registration/login.dart';
import 'package:study_dote/screens/home_screen.dart';
import 'package:study_dote/utils/my_prefs.dart';

class SplashScreen extends StatelessWidget{

  BuildContext _context;

  checkExistence(){
    Future.delayed(Duration(milliseconds: 1500)).then((v){
      MyPrefs.checkOnFirstLaunch().then((bool value){
        if(value){
          Navigator.of(_context).pushReplacement(CupertinoPageRoute(
              builder: (BuildContext context) => Home()));
        }else {
          //No user is logged in
          Navigator.of(_context).pushReplacement(CupertinoPageRoute(
              builder: (BuildContext context) => FirstScreen()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    checkExistence();
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250.0,
          child: Image.asset('assets/first_screen.png'),
        ),
      ),
    );
  }

}
