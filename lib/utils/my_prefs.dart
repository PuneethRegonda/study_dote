import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class MyPrefs{

  static SharedPreferences preferences;

  static Future<bool> setLoginDetails(String id,String password,String email) async{
    preferences = await SharedPreferences.getInstance();
    preferences.setBool('isloggedin',true);
    preferences.setString('id',id);
    preferences.setString('email',email);
    preferences.setString('password',password);
    return true;
  }

  static Future<bool> setTokenLoginDetails(String id,String password,String email,String token,String rtoken) async{
    preferences = await SharedPreferences.getInstance();
    preferences.setBool('isloggedin',true);
    preferences.setString('id',id);
    preferences.setString('email',email);
    preferences.setString('password',password);
    preferences.setString('token',token);
    preferences.setString('rtoken',rtoken);
    return true;
  }

  static Future<bool> setUserLoggedIn() async{
    preferences = await SharedPreferences.getInstance();
    return preferences.setBool('isloggedin',true);
  }

  static Future<bool> checkOnFirstLaunch() async{
    preferences = await SharedPreferences.getInstance();
    //Future.delayed(Duration(seconds: 2)).whenComplete((){
      return preferences.getBool('isloggedin') ?? false;
    //});
  }

  static Future<bool> isUserLoggedIn() async{
    preferences = await SharedPreferences.getInstance();
    return preferences.getBool('isloggedin') ?? false;
  }

  static Future<String> getToken() async{
    preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
  }

  static Future<bool> setToken(String token) async{
    preferences = await SharedPreferences.getInstance();
    return preferences.setString('token',token);
  }

  static Future<String> getRToken() async{
    preferences = await SharedPreferences.getInstance();
    return preferences.getString('rtoken');
  }

  static Future<bool> setRToken(String rtoken) async{
    preferences = await SharedPreferences.getInstance();
    return preferences.setString('rtoken',rtoken);
  }

  static Future<String> getID() async{
    preferences = await SharedPreferences.getInstance();
    return preferences.getString('id');
  }

  static Future<bool> setID(String id) async{
    preferences = await SharedPreferences.getInstance();
    return preferences.setString('id',id);
  }

  static Future<String> getEmail() async{
    preferences = await SharedPreferences.getInstance();
    return preferences.getString('email');
  }

  static   Future<bool> setEmail(String email) async{
    preferences = await SharedPreferences.getInstance();
    return preferences.setString('email',email);
  }

  static   Future<String> getPassword() async{
    preferences = await SharedPreferences.getInstance();
    return preferences.getString('password');
  }

  static Future<bool> setPassword(String password) async{
    preferences = await SharedPreferences.getInstance();
    return preferences.setString('password',password);
  }



}