import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShowProgressMen{
  static Widget noInternetText = Center(child: Text('No internet connection',style: TextStyle(color: Colors.black,fontSize: 18.0)) );
  static Widget errorRetrievingDataText = Center(child: Text('We are unable to fetch data try later',style: TextStyle(color: Colors.black,fontSize: 18.0)));
  static Widget centerProgress = Center(child: CircularProgressIndicator());
}