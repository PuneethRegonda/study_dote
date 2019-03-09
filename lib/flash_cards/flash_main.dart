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
import 'dart:math';

//String subIds = '';
//
//List<FlashCardDM> _flashCards = [];
//String _titleOfFlipButton = 'Show answer';
//
//double _height,_width;
//
//bool isDataLoaded = false;
//
//class FlashCardMain extends StatefulWidget {
//  FlashCardMain(String ids) {
//    subIds = ids;
//  }
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return FlashCardMainState();
//  }
//}
//
//class FlashCardMainState extends State<FlashCardMain>{
//
//  FlashCardMainState(){
//    _fetchCards();
//  }
//
//  Future _fetchCards() async {
//    _flashCards = [];
//    MyPrefs.getToken().then((String token) async {
//      var response = await get('https://api.studydote.com/flashcard?limit=20&offset=80',
//          headers: {
//            'Content-Type': 'application/json',
//            'Authorization': 'Bearer $token'
//          },);
//      print(response.body);
//      if (response.body.contains('Unauthorized')) {
//        ApiRequest.getAuthTokenAgain().then((String onValue) {
//          _fetchCards();
//        });
//      } else {
//        var jsonData = json.decode(response.body);
//        for (var p in jsonData) {
//          FlashCardDM subject = FlashCardDM(
//              id: p['id'],
//              subjectId: p['subject_id'],
//              headerTitle: p['header_title'],
//              question: p['questions'],
//              answer: p['answer']);
//          //   print('${subject.id} \n');
//          _flashCards.add(subject);
//        }
//        LoadedData.flashCards = _flashCards;
//        setState(() {
//          isDataLoaded = true;
//        });
//      }
//    });
//  }
//
//  Widget whatToShow(){
//    if(isDataLoaded){
//      print('Now returning flash card');
//      return FlashCards();
//    }else{
//      print('Now returning center progress men');
//      return ShowProgressMen.centerProgress;
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    _height = MediaQuery.of(context).size.height;
//    _width = MediaQuery.of(context).size.width;
//    return Scaffold(
//      appBar: AppBar(
//        leading: IconButton(
//            icon: Icon(Icons.arrow_back_ios),
//            onPressed: () => Navigator.of(context).pop()),
//      ),
//      body: whatToShow(),
//    );
//  }
//}

double _height, _width;

TextStyle headingStyle = new TextStyle(
    color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w800);
TextStyle questionStyle = new TextStyle(
    color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600);
TextStyle answerStyle = new TextStyle(
    color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600);

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
                            maxHeight: _height * 4 / 10,
                          ),
                          width: MediaQuery.of(context).size.width * 9 / 10,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0,right: 10.0),
                            child: Center(
                              child: Text(
//                              carddata[counter]['a'],
                                LoadedData.flashCards[counter].answer,
                                textAlign: TextAlign.center,
                                style: answerStyle,
                              ),
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
                          maxHeight: _height * 5 / 10,
                        ),
                        width: MediaQuery.of(context).size.width * 9 / 10,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: _height * .50 / 10,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                                child: Text(
//                              carddata[counter]['t'],
                                  LoadedData.flashCards[counter].headerTitle,
                                  style: headingStyle,
                                )),
                            SizedBox(
                              height: _height * .35 / 10,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                                child: Text(
//                              carddata[counter]['q'],
                                  LoadedData.flashCards[counter].question,
                                  style: questionStyle,
                                )),
                            SizedBox(
                              height: _height * .15 / 10,
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
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(59, 158, 207, 1),
                            Color.fromRGBO(4, 193, 153, 1)
                          ]),
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
      height: _height * 2.20 / 10,
      child: Column(
        children: <Widget>[
          GradientButton(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(59, 158, 207, 1),
              Color.fromRGBO(4, 193, 153, 1)
            ]),
            onPressed: () {
             // print('i know counter is $counter');
              controller.reverse();
              Future.delayed(Duration(milliseconds: 300)).then((value) {
                setState(() {
                  isBack = !isBack;
                 // print('counter is $counter');
                  counter = (++counter) % LoadedData.flashCards.length;
                  //print('counter updated to $counter');
                });
              });
            },
            title: 'I Know',
            width: MediaQuery.of(context).size.width * .9,
            height: _height * .85 / 10,
          ),
          SizedBox(
            height: _height * .20 / 10,
          ),
          GradientButton(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(241, 111, 111, 1),
              Color.fromRGBO(196, 60, 60, 1)
            ]),
            onPressed: () {
              //print('i know counter is $counter');
              controller.reverse();
              Future.delayed(Duration(milliseconds: 300)).then((value) {
                setState(() {
                  isBack = !isBack;
                //  print('counter is $counter');
                  counter = (++counter) % LoadedData.flashCards.length;
                 // print('counter updated to $counter');
                });
              });
            },
            title: 'I dont Know',
            width: MediaQuery.of(context).size.width * .9,
            height: _height * .85 / 10,
          ),
          SizedBox(
            height: _height * .20 / 10,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
      ),
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
  0: {'i': '1', 't': 'Topic1', 'q': 'Question1', 'a': 'Answer1'},
  1: {'i': '2', 't': 'Topic2', 'q': 'Question2', 'a': 'Answer2'},
  2: {'i': '3', 't': 'Topic3', 'q': 'Question3', 'a': 'Answer3'},
  3: {'i': '4', 't': 'Topic4', 'q': 'Question4', 'a': 'Answer4'},
};
/*

[
  {
  "id":82,
  "subject_id":9,
  "header_title":"GLYCOLYSIS",
  "questions":"<p>Mature RBC lacks enzymes of</p>",
  "answer":"<p>TCA cycle</p>",
  "questions_plain":"Mature RBC lacks enzymes of",
  "answer_plain":"TCA cycle"
  }

  ,{"id":83,"subject_id":10,"header_title":"GIT PATHOLOGY","questions":"<p>Typhoid ulcers are</p>","answer":"<p>Longitudinal, Ulceration of peyers patches, Stricture is RARE</p>","questions_plain":"Typhoid ulcers are","answer_plain":"Longitudinal, Ulceration of peyers patches, Stricture is RARE"},{"id":84,"subject_id":2,"header_title":"MUMMIFICATION","questions":"<p>Mummification is seen in</p>","answer":"<p>Dry air condition, Wind, High temperature</p>","questions_plain":"Mummification is seen in","answer_plain":"Dry air condition, Wind, High temperature"},{"id":85,"subject_id":10,"header_title":"RENAL PATHOLOGY","questions":"<p>Renomegaly is seen in</p>","answer":"<p>Diabetic nephropathy, Amyloidosis, Polycystic kidney disease etc</p>","questions_plain":"Renomegaly is seen in","answer_plain":"Diabetic nephr

 */

class GradientButton extends StatelessWidget {
  const GradientButton(
      {Key key,
      @required this.onPressed,
      @required this.gradient,
      @required this.title,
      @required this.width,
      @required this.height})
      : super(key: key);

  final Function onPressed;
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
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        )),
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            shape: BoxShape.rectangle,
            gradient: gradient),
      ),
    );
  }
}
