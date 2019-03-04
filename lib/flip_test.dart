import 'package:flutter/material.dart';
import 'package:study_dote/common/card_flip.dart';
import 'package:study_dote/common/gradient_button.dart';
import 'package:study_dote/loaded_data/statics.dart';
import 'package:universal_widget/universal_widget.dart';

void main() {
  runApp(MyApp());
}

TextStyle headingStyle = new TextStyle(
    color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w800);
TextStyle questionStyle = new TextStyle(
    color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600);
TextStyle answerStyle = new TextStyle(
    color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600);

int counter = 0;
String _front = 'This is front of ${counter + 1}',
    _back = 'This is back of ${counter + 1}';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  bool isBack = false;

  FlipCard thing = new FlipCard(
      front: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        child: SizedBox(
          height: 250.0,
          width: 250.0,
          child: Text('soome'),
        ),
      ),
      back: Center(
        child: Text(
          '$_back',
          style: TextStyle(fontSize: 24.0),
        ),
      ));

  Widget backModel() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      child: Container(
                          constraints: BoxConstraints(
                              minHeight:
                                  MediaQuery.of(context).size.height * 5 / 10),
                          width: MediaQuery.of(context).size.width * 9 / 10,
                          child: Center(
                            child: Text(
                              'Here will be your answer',
                              textAlign: TextAlign.center,
                              style: answerStyle,
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    right: 20.0,
                    top: 0.0,
                    height: 50.0,
                    child: Image.asset('assets/menu_icons/badge_answer.png'),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget frontModel() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      child: Container(
                        constraints: BoxConstraints(
                            minHeight:
                                MediaQuery.of(context).size.height * 5 / 10),
                        width: MediaQuery.of(context).size.width * 9 / 10,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 50.0,
                            ),
                            Text(
                              'Here will be the heading',
                              style: headingStyle,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              'Here will be the question',
                              style: questionStyle,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            GradientButton(
                              title: 'Show Answer',
                              height: 50.0,
                              width:
                                  MediaQuery.of(context).size.width * 7.5 / 10,
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20.0,
                    top: 0.0,
                    height: 50.0,
                    child: Image.asset('assets/menu_icons/badge_question.png'),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget showFrontOptions() {
    return SizedBox(
      height: 65.0,
      child: Column(
        children: <Widget>[
          GradientButton(
              onPressed: () {
                print('showNextQuestion');
              },
              title: 'Next Question',
              width: MediaQuery.of(context).size.width * .9,
              height: 50.0),
          SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }

  Widget showBackOptions() {
    return SizedBox(
      height: 130.0,
      child: Column(
        children: <Widget>[
          GradientButton(
              onPressed: () {
                print('i know');
              },
              title: 'I Know',
              width: MediaQuery.of(context).size.width * .9,
              height: 50.0),
          SizedBox(
            height: 15.0,
          ),
          GradientButton(
              onPressed: () {
                print('i dont know');
              },
              title: 'I dont Know',
              width: MediaQuery.of(context).size.width * .9,
              height: 50.0),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flip it dude'),
      ),
      body: frontModel(),
      bottomNavigationBar: !isBack ? showFrontOptions() : showBackOptions(),
    );
  }
}
