import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class FlipScoppedModel extends Model{
  AnimationController flipcontroller;
  Animation<double> frontRotation;
  Animation<double> backRotation;
  final int speed = 500;
  bool isFront=true;
  bool pointerState = false;
  bool passwordstatus = false;
  bool isBack= false;
  void ispasswordstatus(){
    passwordstatus=!passwordstatus;
    notifyListeners();
  }

  toggleCard() {
    if (isFront) {
      print('gonig forward');
      flipcontroller.forward();
    } else {
      print('going backward');
      flipcontroller.reverse();
    }
    isFront = !isFront;
    pointerState = !pointerState;
    notifyListeners();
  }



}