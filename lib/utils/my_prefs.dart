import 'dart:collection';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:study_dote/data_models/user_data.dart';

class MyPrefs {
  static SharedPreferences preferences;

  static Future<bool> setUserLoggedIn() async {
    //preferences = await SharedPreferences.getInstance();
    return preferences.setBool('isloggedin', true) ?? false;
  }

  static Future<bool> checkOnFirstLaunch() async {
    preferences = await SharedPreferences.getInstance();

    if(preferences.getBool('isloggedin') ?? false) {
      UserData.userId = preferences.getString('id');
      UserData.email = preferences.getString('email');
      UserData.password = preferences.getString('password');
      UserData.authToken = preferences.getString('token');
      UserData.refreshToken = preferences.getString('rtoken');
      return true;
    }else{
      return false;
    }
    return preferences.getBool('isloggedin') ?? false;
  }

  static Future<bool> isUserLoggedIn() async {
   // preferences = await SharedPreferences.getInstance();
    return preferences.getBool('isloggedin') ?? false;
  }


  static Future<bool> setLoginDetails(
      String id, String password, String email) async {
    //preferences = await SharedPreferences.getInstance();
    preferences.setBool('isloggedin', true);
    preferences.setString('id', id);
    preferences.setString('email', email);
    preferences.setString('password', password);
    return true;
  }

  static Future<bool> setTokenLoginDetails(String id, String password, String email, String token, String rtoken) async {
    //preferences = await SharedPreferences.getInstance();
    preferences.setBool('isloggedin', true);
    preferences.setString('id', id);
    preferences.setString('email', email);
    preferences.setString('password', password);
    preferences.setString('token', token);
    preferences.setString('rtoken', rtoken);
    return true;
  }

  static Future<String> getToken() async {
   // preferences = await SharedPreferences.getInstance();
    return preferences.getString('token') ?? null;
  }

  static Future<bool> setToken(String token) async {
    preferences = await SharedPreferences.getInstance();
    return preferences.setString('token', token);
  }

  static Future<String> getRToken() async {
    //preferences = await SharedPreferences.getInstance();
    return preferences.getString('rtoken') ?? null;
  }

  static Future<bool> setRToken(String rtoken) async {
    //preferences = await SharedPreferences.getInstance();
    return preferences.setString('rtoken', rtoken);
  }

  static Future<bool> setTokens(String token,String rtoken) async {
    //preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
    return preferences.setString('rtoken', rtoken);
  }

  static Future<String> getID() async {
    //preferences = await SharedPreferences.getInstance();
    return preferences.getString('id');
  }

  static Future<bool> setID(String id) async {
    //preferences = await SharedPreferences.getInstance();
    return preferences.setString('id', id);
  }

  static Future<String> getEmail() async {
    //preferences = await SharedPreferences.getInstance();
    return preferences.getString('email') ?? null;
  }

  static Future<bool> setEmail(String email) async {
    //preferences = await SharedPreferences.getInstance();
    return preferences.setString('email', email);
  }

  static Future<String> getPassword() async {
    //preferences = await SharedPreferences.getInstance();
    return preferences.getString('password') ?? null;
  }

  static Future<bool> setPassword(String password) async {
    //preferences = await SharedPreferences.getInstance();
    return preferences.setString('password', password);
  }

  static Future<Map<String,dynamic>> getAllCreds() async {
    //preferences = await SharedPreferences.getInstance();
    Map<String, dynamic> data = new HashMap();

    data.clear();
    data['email'] = preferences.getString('email');
    data['password'] = preferences.getString('password');
    data['token'] = preferences.getString('token');
    data['rtoken'] = preferences.getString('rtoken');
    return data;
  }
}
