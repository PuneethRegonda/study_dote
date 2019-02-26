import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'login.dart';
import 'signup.dart';

final Shader linearGradient = LinearGradient(
  colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() {
    return new FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  double _width,_height;

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
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          color: Colors.white,
          width: double.infinity,
          child: FadeTransition(
            opacity: _controller,
            child: BodyLayOut(),
          )),
      //bottomNavigationBar: _getBottomSheet(),
    );
  }

  Widget _getBottomSheet(){
    return Column(
      children: <Widget>[
      GradientButton(
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (BuildContext context) => SignUp()));
        },
        title: ' Signup ',
        width: _width*8/10,
        height: 60.0,
        isgradientcolor: true,
      ),
      SizedBox(
        height: 10.0,
      ),
      GradientButton(
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (BuildContext context) => Login()));
        },
        title: 'Login',
        width: _width*8/10,
        height: 60.0,
        isgradientcolor: false,
      ),
      SizedBox(
        height: 10.0,
      ),
    ],);
  }
}

class BodyLayOut extends StatelessWidget {
  const BodyLayOut({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
//        Container(
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(10.0),
//            image: DecorationImage(
//                image: AssetImage('assets/first_screen.png'),
//                fit: BoxFit.fitHeight),
//          ),
//          height: height*3.5/10,
//          width: width*9/10,
//        ),
        SizedBox(
          height: 300.0,
          child: Stack(
            children: <Widget>[
              Image.asset('assets/doc_with_tab_fs.png',fit: BoxFit.fitWidth,),
              Positioned(top: 100.0,right:0.0,left: 0.0,child: Image.asset('assets/study_dote_fs.png')),
            ],
          ),
        ),
        SizedBox(height: 10.0,),
        SizedBox(
          child: Text("Welcome to StudyDote", textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: height * 0.40 / 10, fontWeight: FontWeight.w800),),
        ),
        SizedBox(height: 10.0,),
        SizedBox(
          width: width*8/10,
          child: Text("Most trusted platform for MD/MS entrance examination",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: height * 0.26 / 10),),
        ),
        Expanded(
          child: SizedBox(),
        ),
        GradientButton(
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (BuildContext context) => SignUp()));
          },
          title: ' Signup ',
          width: width*8/10,
          height: 60.0,
          isgradientcolor: true,
        ),
        SizedBox(
          height: 25.0,
        ),
        GradientButton(
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (BuildContext context) => Login()));
          },
          title: 'Login',
          width: width*8/10,
          height: 60.0,
          isgradientcolor: false,
        ),
        SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton(
      {Key key,
        @required this.onPressed,
        @required this.title,
        @required this.width,
        @required this.height,
        @required this.isgradientcolor,

      })
      : super(key: key);

  final Function onPressed;
  final String title;
  final double width;
  final double height;
  final bool isgradientcolor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0)
      ),
      elevation: isgradientcolor?10.0:10.0,
      highlightColor: Colors.white,
//      splashColor: Color.fromRGBO(5, 193, 154, 1),
      onPressed: onPressed,
      child: Container(
        child: Center(
            child: Text(
              title,
              style: TextStyle(
                letterSpacing: 1.0,
                fontSize: 20.0,
//            foreground: Paint()..shader = linearGradient,
                color: isgradientcolor?Colors.white:Colors.black,
              ),
            )),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: isgradientcolor?null:Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 3.0),
                blurRadius: 5.0,
              ),
            ],

            border: isgradientcolor?null:Border.all(
              width: 0.5,
              style: BorderStyle.solid,
              color: Colors.grey,
            ),
//          color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            shape: BoxShape.rectangle,
            gradient: isgradientcolor?new LinearGradient(
              colors: [
                Color.fromRGBO(57, 160, 205, 1),
                Color.fromRGBO(5, 193, 154, 1)
              ],
            ):null
        ),
      ),
    );
  }
}
