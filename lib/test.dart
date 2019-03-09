import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

TextStyle headingStyle = new TextStyle(
    color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w800);
TextStyle questionStyle = new TextStyle(
    color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600);
TextStyle answerStyle = new TextStyle(
    color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600);


class MyApp extends StatelessWidget {
//  static bool isFront = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlashCards(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FlashCards extends StatefulWidget {
  final int speed = 500;

  @override
  _FlashCardsState createState() => _FlashCardsState();
}

class _FlashCardsState extends State<FlashCards>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> _frontRotation;
  Animation<double> _backRotation;
  int counter = 0;

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


  Widget showFrontOptions() {
    return SizedBox(
      height: 65.0,
      child: Column(
        children: <Widget>[
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
              gradient: LinearGradient(
                  colors: [Color.fromRGBO(59, 158, 207, 1), Color.fromRGBO(4, 193, 153, 1)]),
              onPressed: () {
                print('i know counter is $counter');
                controller.reverse();
                Future.delayed(Duration(milliseconds: 300)).then((value) {
                  setState(() {
                    isBack = !isBack;
                    print('counter is $counter');
                    counter = (++counter)%carddata.length;
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
              gradient: LinearGradient(
                  colors: [Color.fromRGBO(241, 111, 111, 1), Color.fromRGBO(196, 60, 60, 1)]),
              onPressed: () {
                print('i know counter is $counter');
                controller.reverse();
                Future.delayed(Duration(milliseconds: 300)).then((value) {
                  setState(() {
                    isBack = !isBack;
                    print('counter is $counter');
                    counter = (++counter)%carddata.length;
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
        title: Text('Flash Cards'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          AnimationCard(
            animation: _backRotation,
            child: backModel(),
            direction: FlipDirection.HORIZONTAL,
          ),

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

Map<int, dynamic> carddata = {
  0: {'t': 'Topic1', 'q': 'Question1', 'a': 'Answer1'},
  1: {'t': 'Topic2', 'q': 'Question2', 'a': 'Answer2'},
  2: {'t': 'Topic3', 'q': 'Question3', 'a': 'Answer3'},
  3: {'t': 'Topic4', 'q': 'Question4', 'a': 'Answer4'},
};


class GradientButton extends StatelessWidget {

  const GradientButton({
    Key key,
    @required this.onPressed,
    @required this.gradient,
    @required this.title,
    @required this.width,
    @required this.height
  }) : super(key: key);

  final  Function onPressed;
  final String title;
  final double width;
  final double height;
  final LinearGradient gradient;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: Color.fromRGBO(5, 193, 154, 1),
      onPressed: onPressed,
      child: Container(
        child: Center(child:
        Text(title,style: TextStyle(
            fontSize: 20.0,
            color: Colors.white
        ),)),
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            shape: BoxShape.rectangle,
            gradient: gradient
        ),

      ),
    );
  }
}