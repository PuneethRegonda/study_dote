import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:study_dote/home.dart';
import 'dart:convert';

import 'package:study_dote/registration/first_screen.dart';
import 'package:study_dote/registration/login.dart';
import 'package:study_dote/utils/my_prefs.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Widget showErorCard() {
    return Material(
      child: Container(
        width: 120.0,
        height: 120.0,
        child: AlertDialog(
          content: Text('There\'s an erorr in your internet connection'),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'))
          ],
        ),
      ),
    );
  }

  void fun() {
    setState(() {});
  }

  AnimationController _controller;
  Animation<double> animation;



//  @override
//  void didChangeDependencies() {
//    fetchPost();
//    super.didChangeDependencies();
//  }

  @override
  void initState() {

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return FutureBuilder<bool>(
      future: MyPrefs.checkOnFirstLaunch(),

      builder: (context, snapshot) {

        if(snapshot.hasData ){
          if(snapshot.data == true)
            return Home();
          else
            return FirstScreen();
        }else if(snapshot.hasError){
          //MessageBox(context, 'Internet error', 'We are facing few issues out there, please try later').show();
        }else{
          return SplashScreent(controller: _controller, width: width, height: height);
        }

//        if (snapshot.hasData) {
//          if (snapshot.data == null) {
//            print('has no Error and no dataRR');
//            return FirstScreen();
//          }
//
//          /// here we need to send to the DashBoard Page
//          /// Note this is based on this future  **
//          return Login();
//        }
//        if (!snapshot.hasData && snapshot.hasError) {
//          print('has Error');
//          return FirstScreen();
//        }
//        return SplashScreent(
//            controller: _controller, width: width, height: height);
      },
    );
  }
}

class SplashScreent extends StatelessWidget {
  const SplashScreent({
    Key key,
    @required AnimationController controller,
    @required this.width,
    @required this.height,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                Color.fromRGBO(57, 160, 205, 1),
                Color.fromRGBO(5, 193, 154, 1)
              ],
            ),
          ),
          child: FadeTransition(
            opacity: _controller,
            child: Center(
              child: Container(
                width: width * 8 / 10,
                height: height * 5 / 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/first_screen.png'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
