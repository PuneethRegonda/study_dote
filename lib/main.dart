import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:study_dote/home.dart';
import 'package:study_dote/scoped_model/scopedmodel.dart';

import 'package:scoped_model/scoped_model.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
     home: ScopedModel<FlipScoppedModel>(
       model: FlipScoppedModel(),
       child: MaterialApp(
         ///change only myapp() part
         ///everything should be the same
           home: Home(),
       ),
     ),
    )
  );
}

