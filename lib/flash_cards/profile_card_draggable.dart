import 'package:flutter/material.dart';

String Question = 'Answer to the ';
int len = Question.length;

class ProfileCardDraggable extends StatelessWidget {
  final int cardNum;

  ProfileCardDraggable(this.cardNum);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(57, 160, 205, 1),
              Color.fromRGBO(5, 193, 154, 1)
            ],
          )),
          child: Card(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.  center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Topic',style: TextStyle(fontSize: 30.0),textAlign: TextAlign.start,),
                ),

                new Expanded(
                  child:
                      new  Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Here Wil Be The Question?',
                                    textScaleFactor: 0.9,
                                    softWrap: true,
                                    textAlign: TextAlign.justify,
                                      style: new TextStyle(
                                          fontSize: 20.0, fontWeight: FontWeight.w700)
                                  ),
//                                  Text('Who are you www ww www w  w w wf et gg t eg sd s d s?',
//                                    textScaleFactor: 1.0,
//                                    softWrap: true,
//                                    textAlign: TextAlign.justify,
//
//                                    maxLines: 4,
//                                                      overflow: TextOverflow.fade,
//                                                  ),
                                ],
                              ),
                            ],
                          )),
                ),
                new Container(
                    padding: new EdgeInsets.symmetric(
                        vertical: 32.0, horizontal: 16.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {


                          },
                          child: Text('hello'),
                        ),
                        new Text('Card number $cardNum',
                            style: new TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w700)),
//                        new Padding(padding: new EdgeInsets.only(bottom: 8.0)),
//                        new Text('A short description.',
//                            textAlign: TextAlign.start),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
