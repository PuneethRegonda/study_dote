import 'dart:math';
import 'package:flutter/material.dart';
import 'package:study_dote/common/gradient_button.dart';

void main() {
  runApp(MyApp());
}

TextStyle headingStyle = new TextStyle(
    color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w800);
TextStyle questionStyle = new TextStyle(
    color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600);
TextStyle answerStyle = new TextStyle(
    color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600);

//String _front = 'This is front of ${counter + 1}',
//    _back = 'This is back of ${counter + 1}';

class MyApp extends StatelessWidget {
//  static bool isFront = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int speed = 500;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> _frontRotation;
  Animation<double> _backRotation;
  int counter = 0;

  void updatecard() {
    setState(() {
      counter = counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: widget.speed), vsync: this);
    _frontRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: pi / 2)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
    _backRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: -pi / 2, end: 0.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
  }

  bool isBack = false;

  ///
  ///
  /// i didnt  use the [FlipCard]
  /// bez one file is enough for flip
  /// as u asked .  :)
  ///
  ///
  ///

//  FlipCard thing = new FlipCard(
//      front: Card(
//    elevation: 5.0,
//    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
//    child: SizedBox(
//      height: 250.0,
//      width: 250.0,
//      child: Text('soome'),
//    ),
//  ),
//      back: Center(
//        child: Text(
//          '$_back',
//          style: TextStyle(fontSize: 24.0),
//        ),
//      ));

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
                              carddata[counter]['a'],
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
                                carddata[counter]['t'],
                                style: headingStyle,
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                carddata[counter]['q'],
                                style: questionStyle,
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
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    left: 0.0,
                    child: Column(
                      children: <Widget>[
                        GradientButton(
                          title: 'Show Answer',
                          height: 50.0,
                          width: MediaQuery.of(context).size.width *
                              7.5 /
                              10,
                          onPressed: () {
                            if (!isBack) {
                              controller.forward();
                              setState(() {
                                isBack = !isBack;
                              });
                            } else {
                              controller.reverse();
                              setState(() {
                                isBack = !isBack;
                              });
                            }
//                                print('count of card');
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  /*
  Column(
        children: <Widget>[
          GradientButton(
            title: 'Show Answer',
            height: 50.0,
            width: MediaQuery.of(context).size.width * 7.5 / 10,
            onPressed: () {
              if (!isBack) {
                controller.forward();
                setState(() {
                  isBack = !isBack;
                });
              } else {
                controller.reverse();
                setState(() {
                  isBack = !isBack;
                });
              }
//                                print('count of card');
            },
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      )
   */

  Widget showFrontOptions() {
    return SizedBox(
      height: 65.0,
      child: Column(
        children: <Widget>[
//          GradientButton(
//              onPressed: () {
//                setState(() {
//                  print('counter is $counter');
//                  counter=counter+1;
//                  print('counter updated to $counter');
//                });
//                print('showNextQuestion');
//              },
//              title: 'Next Question',
//              width: MediaQuery.of(context).size.width * .9,
//              height: 50.0),
          SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }

  Widget showBackOptions(AnimationController controller) {
    return SizedBox(
      height: 130.0,
      child: Column(
        children: <Widget>[
          GradientButton(
              onPressed: () {
                print('i know counter is $counter');
                controller.reverse();
                Future.delayed(Duration(milliseconds: 300)).then((value) {
                  setState(() {
                    isBack = !isBack;
                    print('counter is $counter');
                    counter = counter + 1;
                    print('counter updated to $counter');
                  });
                });
              },
              title: 'I Know',
              width: MediaQuery.of(context).size.width * .9,
              height: 50.0),
          SizedBox(
            height: 15.0,
          ),
          GradientButton(
              onPressed: () {
                print('i know counter is $counter');
                controller.reverse();
                Future.delayed(Duration(milliseconds: 300)).then((value) {
                  setState(() {
                    isBack = !isBack;
                    print('counter is $counter');
                    counter = counter + 1;
                    print('counter updated to $counter');
                  });
                });
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
      body: Stack(
        children: <Widget>[
          AnimationCard(
            animation: _backRotation,
            child: backModel(),
            direction: FlipDirection.HORIZONTAL,
          ),

          ///as to over come the bug  used the [AbsorbPointer]
          ///to know what is bug set absorbing to flase and
          ///click on the in middel  of the answer card
          ///
          ///
          AnimationCard(
            animation: _frontRotation,
            child: AbsorbPointer(
                absorbing: !isBack ? false : true, child: frontModel()),
            direction: FlipDirection.HORIZONTAL,
          ),
        ],
      ),
      bottomNavigationBar:
          !isBack ? showFrontOptions() : showBackOptions(controller),
    );
  }
}

enum FlipDirection {
  VERTICAL,
  HORIZONTAL,
}

class AnimationCard extends StatelessWidget {
  AnimationCard({this.child, this.animation, this.direction});

  final Widget child;
  final Animation<double> animation;
  final FlipDirection direction;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        var transform = Matrix4.identity();
        transform.setEntry(3, 2, 0.001);
        if (direction == FlipDirection.VERTICAL) {
          transform.rotateX(animation.value);
        } else {
          transform.rotateY(animation.value);
        }
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: child,
    );
  }
}

///
/// int is for id
///
/// dynamic is for map of Map<String , String >
///

Map<int, dynamic> carddata = {
  0: {'t': 'Topic1', 'q': 'Question1', 'a': 'Answer1'},
  1: {'t': 'Topic2', 'q': 'Question2', 'a': 'Answer2'},
  2: {'t': 'Topic2', 'q': 'Question3', 'a': 'Answer3'},
  3: {'t': 'Topic2', 'q': 'Question4', 'a': 'Answer4'},
};

//print('${carddata[counter]['Q'] }');
