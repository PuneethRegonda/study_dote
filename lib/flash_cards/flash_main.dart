import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:study_dote/scoped_model/scopedmodel.dart';
import 'swipe_feed_page.dart';
import 'dart:math';

class FlashCardMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: FalshCard(),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, left: 20.0,right: 20.0),
          child: ScopedModelDescendant(builder: (BuildContext context,Widget child, FlipScoppedModel model){
            return GradientButton(
              onPressed: () {
                print('hello');
                return model.toggleCard();
              },
              title: 'FlipCard',
              width: size.width * 0.5/10,
              height: size.height * 0.078,
            );
          })
      ),
    );
  }
}

class FalshCard extends StatefulWidget {
  @override
  _FalshCardState createState() => _FalshCardState();
}

//String question = 'Answer to the questionbnbbbbb23456789';
//int len = question.length;

class _FalshCardState extends State<FalshCard> {
  bool pointerState = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, widget, FlipScoppedModel model) {
          return FlipCard(
            model: model,
            direction: FlipDirection.HORIZONTAL,
            front: AbsorbPointer(absorbing: pointerState, child: SwipeFeedPage()),
            back: AbsorbPointer(
              absorbing: true,
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      return FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Center(
                      child: Wrap(
                          verticalDirection: VerticalDirection.down,
                          children: <Widget>[
                            Text("Your answer will be shown here",textAlign: TextAlign.center,style: TextStyle(fontSize: 24.0),)
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
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

class FlipCard extends StatefulWidget {
  final FlipScoppedModel model;
  final Widget front;
  final Widget back;
  final int speed = 500;
  final FlipDirection direction;

  const FlipCard(
      {Key key,
        @required this.model,
        @required this.front,
        @required this.back,
        this.direction = FlipDirection.HORIZONTAL})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FlipCardState();
  }
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
//  AnimationController flipcontroller;
//  Animation<double> frontRotation;
//  Animation<double> backRotation;
//
//  bool isFront = true;
///these r in scopedmodel
  @override
  void initState() {
    super.initState();
    widget.model.flipcontroller = AnimationController(
        duration: Duration(milliseconds: widget.speed), vsync: this);
    widget.model.frontRotation = TweenSequence(
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
    ).animate(widget.model.flipcontroller);
    widget.model.backRotation = TweenSequence(
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
    ).animate(widget.model.flipcontroller);
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.model.pointerState,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AnimationCard(
            animation: widget.model.backRotation,
            child: widget.back,
            direction: widget.direction,
          ),
          AnimationCard(
            animation: widget.model.frontRotation,
            child: widget.front,
            direction: widget.direction,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.model.flipcontroller.dispose();
    super.dispose();
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton(
      {Key key,
        @required this.onPressed,
        @required this.title,
        @required this.width,
        @required this.height})
      : super(key: key);

  final Function onPressed;
  final String title;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment(0.0, 0.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          shape: BoxShape.rectangle,
          gradient: new LinearGradient(
            colors: [
              Color.fromRGBO(57, 160, 205, 1),
              Color.fromRGBO(5, 193, 154, 1)
            ],
          ),
        ),
      ),
    );
  }
}


