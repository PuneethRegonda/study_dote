import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:study_dote/common/progress_men.dart';
import 'package:study_dote/data_models/flash_card.dart';
import 'package:study_dote/loaded_data/loaded_data.dart';
import 'package:study_dote/scoped_model/scopedmodel.dart';
import 'package:study_dote/utils/api_requests.dart';
import 'package:study_dote/utils/my_prefs.dart';
import 'swipe_feed_page.dart';
import 'dart:math';

String subIds = '';

List<FlashCardDM> _flashCards = [];
String _titleOfFlipButton = 'Show answer';

bool isDataLoaded = false;

class FlashCardMain extends StatefulWidget {
  FlashCardMain(String ids) {
    subIds = ids;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FlashCardMainState();
  }
}

class FlashCardMainState extends State<FlashCardMain>{

  FlashCardMainState(){
    _fetchCards();
  }

  Future _fetchCards() async {
    _flashCards = [];
    MyPrefs.getToken().then((String token) async {
      var response = await get('https://api.studydote.com/flashcard?limit=20&offset=80',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },);
      print(response.body);
      if (response.body.contains('Unauthorized')) {
        ApiRequest.getAuthTokenAgain().then((String onValue) {
          _fetchCards();
        });
      } else {
        var jsonData = json.decode(response.body);
        for (var p in jsonData) {
          FlashCardDM subject = FlashCardDM(
              id: p['id'],
              subjectId: p['subject_id'],
              headerTitle: p['header_title'],
              question: p['questions'],
              answer: p['answer']);
          //   print('${subject.id} \n');
          _flashCards.add(subject);
        }
        setState(() {
          isDataLoaded = true;
        });
        LoadedData.flashCards = _flashCards;
      }
    });
  }

  Widget whatToShow(){
    if(isDataLoaded){
      return FlashCard();
    }else{
      return ShowProgressMen.centerProgress;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: FlashCard(),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, right: 20.0),
          child: ScopedModelDescendant(builder:
              (BuildContext context, Widget child, FlipScoppedModel model) {
            return GradientButton(
              onPressed: () {
                //print('hello');
                setState(() {
                  if(_titleOfFlipButton == 'Show answer')
                    _titleOfFlipButton = 'Hide answer';
                  else
                    _titleOfFlipButton = 'Show answer';
                });
                return model.toggleCard();
              },
              title: _titleOfFlipButton,
              width: size.width * 0.5 / 10,
              height: size.height * 0.078,
            );
          })),
    );
  }

}

class FlashCard extends StatefulWidget {
  @override
  _FlashCardState createState() => _FlashCardState();
}

//String question = 'Answer to the questionbnbbbbb23456789';
//int len = question.length;

class _FlashCardState extends State<FlashCard> {
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
                        Text(
                          "Your answer will be shown here",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24.0),
                        )
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
