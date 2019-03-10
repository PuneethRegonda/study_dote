import 'package:flutter/material.dart';
import 'package:study_dote/common/card_flip.dart';
import 'package:study_dote/common/gradient_button.dart';
import 'package:folding_widget/folding_widget.dart';
import 'package:study_dote/loaded_data/statics.dart';
import 'package:universal_widget/universal_widget.dart';

//void main() {
//  runApp(MaterialApp(
//    debugShowCheckedModeBanner: false,
//    home: MyApp(),
//  ));
//}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    FoldingWidget ff = new FoldingWidget('Tap here 1',
        Text('Hello this is a stupid string out of which I do nothing but nothing else is this something valuable'));

    ff.setCardBackgroundColor(Colors.green);

    FoldingWidget fff = new FoldingWidget('Tap here 2',
        Text('Hello this is a stupid string out of which I do nothing but nothing else is this something valuable'));

    FoldingWidget f = new FoldingWidget('Tap here 3',
        Text('Hello this is a stupid string out of which I do nothing but nothing else is this something valuable'));

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 50.0,),
          ff,fff,f
        ],
      ),
    );
  }
}
