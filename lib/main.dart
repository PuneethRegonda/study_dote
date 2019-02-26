import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:study_dote/flash_cards/flash_main.dart';
import 'package:study_dote/home.dart';
import 'package:study_dote/registration/signup.dart';
import 'package:study_dote/scoped_model/scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:study_dote/splash_screen.dart';
import 'package:study_dote/user_profile_settings.dart';
import 'package:study_dote/utils/Urls.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScopedModel<FlipScoppedModel>(
          model: FlipScoppedModel(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Setting(),
          ),
        ),
      )
  );
}

