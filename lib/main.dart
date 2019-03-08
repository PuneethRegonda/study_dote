import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:study_dote/common/progress_dialog.dart';
import 'package:study_dote/flash_cards/flash_card_select_topics.dart';
import 'package:study_dote/flash_cards/flash_main.dart';
import 'package:study_dote/main/home.dart';
import 'package:study_dote/registration/first_screen.dart';
import 'package:study_dote/registration/first_time_verification.dart';
import 'package:study_dote/registration/signup.dart';
import 'package:study_dote/scoped_model/scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:study_dote/main/splash_screen.dart';
import 'package:study_dote/main/user_profile_settings.dart';
import 'package:study_dote/utils/my_prefs.dart';
import 'package:study_dote/utils/urls.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ScopedModel<FlipScoppedModel>(
      model: FlipScoppedModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstTimeVerification(),
      ),
    ),
  ));
}

