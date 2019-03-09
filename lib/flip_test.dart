import 'package:flutter/material.dart';
import 'package:study_dote/common/card_flip.dart';
import 'package:study_dote/common/gradient_button.dart';
import 'package:study_dote/loaded_data/statics.dart';
import 'package:universal_widget/universal_widget.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 50.0,),
          Folding(),
          Folding(),
        ],
      ),
    );
  }
}

class Folding extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<Folding> {
  var icon = Icons.chevron_right;

  bool showContent = false;

  Widget _top() {
    return InkWell(
      onTap: () {
        setState(() {
          if (showContent) {
            showContent = !showContent;
            icon = Icons.chevron_right;
          } else {
            showContent = !showContent;
            icon = Icons.keyboard_arrow_down;
          }
        });
      },
      child: Padding(
        padding:
            EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0, bottom: 15.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Tap to expand',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
              ),
            ),
            Icon(icon)
          ],
        ),
      ),
    );
  }

  Widget _content() {
    if (showContent)
      return SizedBox(
          //height: 50.0,
          child: Center(
            child: Text(
              'All your content is shown here',
              style: TextStyle(fontSize: 24.0),
            ),
          ));
    else
      return Container();
  }

  double op = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
//            SizedBox(height: 50.0,),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 9.5 / 10,
            child: Card(
                elevation: 10.0,
                child: SizedBox(
                  //height: 200.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _top(),
                      _content(),
                    ],
                  ),
                )),
          ),
        )
      ],
    );
  }
}
